import { TestBed } from '@angular/core/testing';

import { CommomnService } from './commomn.service';

describe('CommomnService', () => {
  let service: CommomnService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(CommomnService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
