import { Profile } from './profile.model';
import { JobApplication } from './jobapplication.model'
import { InterviewQuestion } from './interview-question.model'
import { Title } from '@angular/platform-browser';

export interface Article {
  slug: string;
  title: string;
  description: string;
  body: string;
  tagList: string[];
  createdAt: string;
  updatedAt: string;
  favorited: boolean;
  favoritesCount: number;
  id: string,
  minSalary: string,
  maxSalary:string,
  applicationStatus : string,
  jobDescription: string,
  noOfOpenings :string,
  contractType: string,
  contractPeriod:string,
  jobtitle:string,
  author: Profile;
  createdEmployee:Profile;
  applications:JobApplication[];
  questions:InterviewQuestion[];
}
