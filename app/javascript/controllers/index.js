import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)
import PaymentController from "./payment_controller"
application.register("payment", PaymentController)
