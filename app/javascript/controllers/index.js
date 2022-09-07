// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import FilterContactsController from "./filter_contacts_controller"
application.register("filter-contacts", FilterContactsController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import KeywordsForTriggerController from "./keywords_for_trigger_controller"
application.register("keywords-for-trigger", KeywordsForTriggerController)

import NewTemplateController from "./new_template_controller"
application.register("new-template", NewTemplateController)

import NewTriggerController from "./new_trigger_controller"
application.register("new-trigger", NewTriggerController)

import WhyHighlightController from "./why_highlight_controller"
application.register("why-highlight", WhyHighlightController)
