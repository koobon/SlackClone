import {
  CallHandler,
  ExecutionContext,
  Injectable,
  NestInterceptor,
} from '@nestjs/common';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

//인터 셉터는 컨트롤러 다음에 어떤 동작을 할지 이럴 때 보통 쓸 수 있다
//언디파인드 값을 널로 리턴하는 인터셉터

@Injectable()
export class UndefinedToNullInterceptor implements NestInterceptor {
  intercept(
    context: ExecutionContext,
    next: CallHandler,
  ): Observable<any> | Promise<Observable<any>> {
    return next
      .handle()
      .pipe(map((data) => (data === undefined ? null : data)));
  }
}
