import { ExecutionContext } from 'nest/node_modules/@nestjs/common/interfaces';
import { Injectable } from '@nestjs/common/decorators';
import { AuthGuard } from '@nestjs/passport/dist';

@Injectable()
export class LocalAuthGuard extends AuthGuard('local'){
    async canActivate(context: ExecutionContext): Promise<boolean>{
        const can = await super.canActivate(context);
        if(can){
            const request = context.switchToHttp().getRequest();
            console.log('login for cookie');
            await super.logIn(request);
        }
        return true;
    }
}