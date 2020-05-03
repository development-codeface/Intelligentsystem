import { Component, Input } from '@angular/core';

import { Article, ArticleListConfig, ArticlesService, UserService } from '../../core';
@Component({
  selector: 'app-article-list',
  styleUrls: ['article-list.component.css'],
  templateUrl: './article-list.component.html'
})
export class ArticleListComponent {
  constructor (
    private articlesService: ArticlesService,
    private userService: UserService
  ) {}

  @Input() limit: number;
  @Input()
  set config(config: ArticleListConfig) {
    if (config) {
      this.query = config;
      this.currentPage = 1;
      this.runQuery();
    }
  }

  query: ArticleListConfig;
  results: any[];
  loading = false;
  currentPage = 1;
  totalPages: Array<number> = [1];

  setPageTo(pageNumber) {
    this.currentPage = pageNumber;
    this.runQuery();
  }

  runQuery() {
    this.loading = true;
    this.results = [];

    // Create limit and offset filter (if necessary)
    if (this.limit) {
      this.query.filters.limit = this.limit;
      this.query.filters.offset =  (this.limit * (this.currentPage - 1));
    }
    if(this.query.type == 'feed'){ 
      this.userService.getmydetail()
      .subscribe(data => {
        this.results = data.jobpostings;
        this.loading = false;
        console.log(data);
        // Used from http://www.jstips.co/en/create-range-0...n-easily-using-one-line/
        this.totalPages = Array.from(new Array(Math.ceil(data.jobpostings.length / this.limit)), (val, index) => index + 1);
      });
    }else {
      this.articlesService.query(this.query)
      .subscribe(data => {
        this.loading = false;
        this.results = data;
        console.log(this.results);
  
        // Used from http://www.jstips.co/en/create-range-0...n-easily-using-one-line/
        this.totalPages = Array.from(new Array(Math.ceil(data.length / this.limit)), (val, index) => index + 1);
      });
    }
    
  }
}
