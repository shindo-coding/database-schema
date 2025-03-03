import { Global, Module } from '@nestjs/common';
import { PrismaModule } from './prisma/prisma.module';
import { HealthController } from './health/health.controller';
import { HttpModule } from '@nestjs/axios';

@Global()
@Module({
	controllers: [HealthController],
	imports: [
		PrismaModule,
		HttpModule,
	],
	providers: [PrismaModule],
	exports: [PrismaModule],
})
export class InfraModule {}
