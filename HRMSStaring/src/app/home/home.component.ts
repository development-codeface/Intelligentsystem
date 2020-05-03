import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, FormControl, Validators } from '@angular/forms';
import { Router, ActivatedRoute } from '@angular/router';

import { ArticleListConfig, Errors, TagsService, User, UserService } from '../core';


@Component({
  selector: 'app-home-page',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
  title: String = '';
  authType: String = '';
  errors: Errors = {errors: {}};
  isSubmitting = false;
  authForm: FormGroup;
  currentUser: User;
  constructor(
    private router: Router,
    private tagsService: TagsService,
    private userService: UserService,
    private route: ActivatedRoute,
    private fb: FormBuilder
  ) {
    this.authForm = this.fb.group({
      'username': ['', Validators.required],
      'password': ['', Validators.required]
    });
  }

  isAuthenticated: boolean;
  noAdminUser : boolean ;
  
  listConfig: ArticleListConfig = {
    type: 'all',
    filters: {}
  };
  tabselect:String;
  tags: Array<string> = [];
  tagsLoaded = false;

  ngOnInit() {
    this.title = "Login";
    this.authType = 'login'
    this.tabselect ='all';
    this.userService.isAuthenticated.subscribe(
      (authenticated) => {
        this.isAuthenticated = authenticated;
        if(!this.noAdminUser && this.isAuthenticated){
          this.setListTo('feed');
          this.tabselect ='feed';
        }else {
          this.tabselect ='all';
          this.setListTo('all');
        }
      }
    );
    this.userService.currentUser.subscribe(
      (userData: User) => {
        this.currentUser = userData;
        this.noAdminUser = userData.role == 'ROLE_ADMIN';
        if(!this.noAdminUser && this.isAuthenticated){
          this.setListTo('feed');
          this.tabselect ='feed';
        }else {
          this.tabselect ='all';
          this.setListTo('all');
        }
      }
    );


    /*this.tagsService.getAll()
    .subscribe(tags => {
      this.tags = tags;
      this.tagsLoaded = true;
    });*/
  }
  submitForm() {
    this.isSubmitting = true;
    this.errors = {errors: {}};

    const credentials = this.authForm.value;
    this.userService
    .attemptAuth(this.authType, credentials)
    .subscribe(
      data => { 
        this.router.navigateByUrl('/')
      },
      err => {
        this.errors = err;
        this.isSubmitting = false;
      }
    );
  }

  setListTo(type: string = '', filters: Object = {}) {
    // If feed is requested but user is not authenticated, redirect to login
    if (type === 'feed' && !this.isAuthenticated) {
      this.router.navigateByUrl('/login');
      return;
    }
      
    this.tabselect = type;
    /*if(type === 'feed'){
      filters = {author: this.currentUser.username};
    }*/

    // Otherwise, set the list object
    this.listConfig = {type: type, filters: filters};
  }
}
