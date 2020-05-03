import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, FormControl, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { ModalComponent } from '../modal/modal.component';

import { Article, ArticlesService, UserService } from '../core';


@Component({
  selector: 'app-editor-page',
  templateUrl: './editor.component.html'
})
export class EditorComponent implements OnInit {
  article: Article = {} as Article;
  articleForm: FormGroup;
  tagField = new FormControl();
  document = new FormControl();
  questiongentitle:String = "Generate Questions";
  file: File | null = null;;
  errors: Object = {};
  isSubmitting = false;
  editflow = false;
  contractOption: any[] = ["Permanent", "Contract"];
  constructor(
    private articlesService: ArticlesService,
    private userService :UserService,
    private route: ActivatedRoute,
    private router: Router,
    private fb: FormBuilder,
    public matDialog: MatDialog
  ) {
    // use the FormBuilder to create a form group
    this.articleForm = this.fb.group({
      jobtitle: '',
      jobDescription: '',
      body: '',
      minSalary : '',
      maxSalary : '',
      noOfOpenings : '',
      contractType : '',
      contractPeriod : '',
      file:''
    });

    // Initialized tagList as empty array
    this.article.tagList = [];

    // Optional: subscribe to value changes on the form
    // this.articleForm.valueChanges.subscribe(value => this.updateArticle(value));
  }

  ngOnInit() {
    // If there's an article prefetched, load it
    this.route.data.subscribe((data: { article: Article }) => {
      if (data.article) {
        this.article = data.article;
        if(typeof(this.article) != "undefined")
          this.editflow = true;
        if(this.article.questions && this.article.questions.length > 0){
          this.questiongentitle = "View Questions.";
        }  
        this.articleForm.patchValue(data.article);
      }
    });
  }

  addTag() {
    // retrieve tag control
    const tag = this.tagField.value;
    // only add tag if it does not exist yet
    if (this.article.tagList.indexOf(tag) < 0) {
      this.article.tagList.push(tag);
    }
    // clear the input
    this.tagField.reset('');
  }

  removeTag(tagName: string) {
    this.article.tagList = this.article.tagList.filter(tag => tag !== tagName);
  }

  submitForm() {
    this.isSubmitting = true;

    // update the model
    this.updateArticle(this.articleForm.value);

    // post the changes
    this.articlesService.save(this.article).subscribe(
      article => {
        if(typeof(article) != "undefined"){
          this.router.navigateByUrl('/article/' + article.id)
        }
      },
      err => {
        this.errors = err;
        this.isSubmitting = false;
      }
    );
  }

  updateArticle(values: Object) {
    Object.assign(this.article, values);
    this.article['applicationStatus'] = "OPEN";
    this.article['createdById']  =  this.userService.getCurrentUser().id;
  }

  onFileChange(event) {
    if (event.target.files.length > 0) {
      const file = event.target.files[0];
      
      if (file) {
        if ((/\.(jpg|jpeg|png|pdf|zip)$/i).test(file.name) && file.size <= 2000000) {
          //this.form.controls['photo'].setErrors(null);
          this.file = file;
        } else {
          //this.form.controls['photo'].setErrors({invalid: true});
        }
      }
    }
  }

  generateQuestion(){

    if(this.article.questions.length > 0){
        this.openModal();
    }else {
      this.isSubmitting = true;
      this.questiongentitle = "processing...."
      // update the model
      this.updateArticle(this.articleForm.value);
  
      // post the changes
      this.articlesService.getquestion(this.article).subscribe(
        article => {
          this.questiongentitle = "View Questions.";
          alert("Questions Created !!!! ");
          this.router.navigateByUrl('/article/' + this.article.id);
        },
        err => {
          this.errors = err;
          this.questiongentitle = "View question not generated";
          alert("View question not generated, Try again after some time. ");
          this.router.navigateByUrl('/article/' + this.article.id);
          this.isSubmitting = false;
        }
      );
      alert("Qustion Generation request will take time, Please check after some time ....");
    }
  }
  openModal() {
    const dialogConfig = new MatDialogConfig();
    // The user can't close the dialog by clicking outside its body
    dialogConfig.disableClose = true;
    dialogConfig.id = "modal-component";
    dialogConfig.height = "350px";
    dialogConfig.data = {question: this.article.questions}
    const modalDialog = this.matDialog.open(ModalComponent, dialogConfig);
  }

  uploadResume(){
    const formData = new FormData();
    formData.append("file", this.file);
    formData.append("isMulti","true");
    formData.append("jobid", this.article.id);
    this.articlesService.savedoc(formData).subscribe(
      uploadsucess => {
        
        if(typeof(uploadsucess) != "undefined"){
          this.router.navigateByUrl('/article/' + this.article.id)
        }
      },
      err => {
        console.log(err);
        //this.errors = err;
        //this.isSubmitting = false;
      }
    );
  }
}
