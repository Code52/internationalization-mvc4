## Internationalization.MVC4

### Goals:

Provide a collection of packages to help developers get started building globalized and localized application using ASP.NET MVC. 

### Getting started

 * Fork the code on [GitHub](https://github.com/shiftkey/internationalization-mvc4) and have a play!
 * Introduce yourself in the [JabbR](http://jabbr.net/#/rooms/code52) room!
 * Grab a task from the [Trello](https://trello.com/board/internationalization-mvc4/4f49efbbd105c95e0c12332e) board and get involved!

### Possible package structure

The initial plan is to ship a number of NuGet packages (and sample projects) to allow developers to pull localization features into the app.

#### Note: this is subject to change

 * **Core** - contains the basics of creating and managing resources and consuming them in DataAnnotations and Views. Includes some tricks to ensure your app respects the culture sent from the user's browser to the server.
 * **Testing** - demonstrating how to test the use of resources in an app
 * **Browser** - extending localization to the browser and allowing the user to override the culture. 

Other packages under consideration:

 * **jQueryUI Sample Site** - how to localize UI controls which leverage jQuery and jQuery UI.
 * **KendoUI Sample Site** - how to localize UI controls from the Kendo UI library.