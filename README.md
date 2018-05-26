
# VIPER

V - View, I - Interactor, P - Presenter, E - Entity, R - Router

1. View - Responsibility of view is to send user actions to presenter and show whatever the presenter asks it to.
2. Interactor - It has the business logic for the app specified by a use case.
3. Presenter - Contains the view logic for preparing content for display and for reacting to user interactions.
4. Entity - Basic model for objects used by interaction.
5. Router - Contains logic for routing of screens.

## Why VIPER?

Our traditional MVC and MVM architecture that we are all accquainted with have one primary problem i.e Bulky Controllers. Since all our business logic has been dumped in controller, at the end we see a huge and fat controller which becomes difficult to manage if our project is to be scalable. So thse are the primary reasons why we need VIPER:

1. To make the structure more modular.
2. To build the application on Single responsibility principle.
3. To reduce the load and dependency on controllers.
4. To build the app on basis of use cases or behaviour based.

## Code Description

[Flow Description](https://www.linkedin.com/pulse/viper-architecture-example-ios-swift-4-g-abhisek/?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_post_details%3B5VUVGXL1Qfe86IoIYbiO4w%3D%3D)


## Acknowledgment

* Adeesh Jain
* Avinash Kumar Gautam

