import { ExecutionContext, Injectable } from "../../node_modules/@nestjs/common";
import { AuthGuard } from "../../node_modules/@nestjs/passport";

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