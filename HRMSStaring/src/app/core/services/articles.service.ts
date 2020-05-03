import { Injectable } from '@angular/core';
import { HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';

import { ApiService } from './api.service';
import { Article, ArticleListConfig } from '../models';
import { map } from 'rxjs/operators';

@Injectable()
export class ArticlesService {
  constructor (
    private apiService: ApiService
  ) {}

  query(config: ArticleListConfig): Observable<any[]> {
    // Convert any filters over to Angular's URLSearchParams
    const params = {};

    Object.keys(config.filters)
    .forEach((key) => {
      params[key] = config.filters[key];
    });
   
    return this.apiService
    .get(
      '/job',
      new HttpParams({ fromObject: params })
    );
    
  }

  get(id): Observable<Article> {
    return this.apiService.get('/job/' + id)
      .pipe(map(data => data));
  }

  destroy(id) {
    return this.apiService.delete('/articles/' + id);
  }

  save(article): Observable<Article> {
    // If we're updating an existing article
    if (article.id) {
      return this.apiService.put('/job/' + article.id,  article)
        .pipe(map(data => data));

    // Otherwise, create a new article
    } else {
      return this.apiService.post('/job', article)
        .pipe(map(data => data));
    }
  }

  getquestion(article):Observable<Article> {
    return this.apiService.postdocument('/job/doc/getquestion', article)
        .pipe(map(data => data));
  }

  savedoc(article):Observable<any> {
    return this.apiService.postdocument('/job/doc/upload', article)
        .pipe(map(data => data));
  }

  favorite(slug): Observable<Article> {
    return this.apiService.post('/articles/' + slug + '/favorite');
  }

  unfavorite(slug): Observable<Article> {
    return this.apiService.delete('/articles/' + slug + '/favorite');
  }


}
