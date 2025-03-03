import { Controller, Get } from "@nestjs/common";

@Controller()
export class HealthController {
	constructor() {}

	@Get()
	getInfo() {
		return {
			service: "stock-analysis",
			version: "1.0.0",
		};
	}

	@Get(["/healthz", "livez"])
	async getStatus() {
		return {
			status: "ok",
		};
	}
}
