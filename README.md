
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


## VIPER flow

![VIPERStructure](https://github.com/GABHISEKBUNTY/Viper-Architecture/blob/master/Screen%20Shot%202017-11-22%20at%204.19.15%20PM.png)

- All the communications in the project are usually made using protocols and delegates.

#### View - Presenter
View communicates with the Presenter regarding all the user interactions and asks the presenter to perform necessary handlings regarding the same.

#### Presenter - Interactor
Presenter communicates with Interactor(The brain of the module) regarding user actions or data fetching actions.

#### Interactor - Presenter
Interactor communicates with the presenter regarding the output of the business logic which has performed the necessary actions.

#### Presenter - View
Presenter communicates with the view to make the necessary UI changes with the results from the Interactor.

#### Presenter - Router
Presenter communicates to router regarding navigation between pages.

This flow will be pretty more clear once we dig into some code.


## Sample Code
We will be preparing a small app which list a fruit list that we will having in our diet plan along with the vitamins that they provide to us. Oh cool now it feels, we are going to do a nursery project. Ooof ...relief

The sample code has two modules : A FruitList and FruitDetail module.


### FruitList Module

![FruitList Module](https://github.com/GABHISEKBUNTY/Viper-Architecture/blob/master/Screen%20Shot%202017-11-22%20at%204.02.37%20PM.png)

The fruit list has the following parts in it:

1. View - Fruit List page UI
2. Interactor - Fruit List module's business logic and handlings
3. Presenter - Fruit List module's communication handler, we can tease the presenter like that as it handles all the communication.
4. Entity - Model class of our Fruits
5. Wireframe - Don't get confused, that's our router.

Okay so lets dig into the code:
Lets start from the protocol class that has all our communication methods.


#### Protocols - FruitListProtocols.swift

![ProtocolList](https://github.com/GABHISEKBUNTY/Viper-Architecture/blob/master/Protocols.png)


The "FruitListProtocols.swift" contains all the related protocols and delegate methods that we will be using to communicate between our different handler files.

Now lets start a simple app flow with detailed description of all the happenings one by one.


### App Flow
* On opening of the app, in the ```viewDidLoad()``` of the FruitListView, we ask the Wireframe to initialise all our related protocols starting from the ones present in the view and till the interactor. Then we notify our presenter using "View -> Presenter" about the loading of the FruitList page as:

```
FruitListWireframe.createFruitListModule(fruitListRef: self)
presenter?.viewDidLoad()
```

* The presenter then calls the interactor using "Presenter -> Interactor" delegate and informs it to fetch all fruits that will be in our diet plan:
```
 interactor?.getFruitList()
```

* The interactor in turn handles the data fetching mechanism, it can be anything like making network request, database fetching operations, etc. Since we are determined not to make our simple project messy, we are using a small "Common.swift" class to get a small list of fruits

```
 Common.generateDataList()
```

* The interactor after fetching our fruit list informs the presenter using the "Interactor -> Presenter" delegate.

```
 presenter?.fruitListDidFetch(fruitList: getAllFruitDetail())
```

* The presenter in turn informs the view about the completion of data fetching using the "Presenter -> View" delegate.
```
 view?.showFruits(with: fruitList)
```

* Now our view handles the displaying of our fruit list loading the tableView.


![FruitList](https://github.com/GABHISEKBUNTY/Viper-Architecture/blob/master/FruitList.png)


Whoa!!! That was easy ..... Wait but we didn't see any router mechanism. Wait we will be seeing that soon.

Click on any fruit and that will open up the fruit detail page with a beautiful image of your selcted fruit. So how the mechanism is going on ??

* In our ```tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)``` , we are handling the user selction. The view calls the presenter using the "View -> Presenter" delegate to handle user selection action.

```
 presenter?.showFruitSelection(with: fruitList[indexPath.row], from: self)
```

* The presenter in turn asks the wireframe/router to show up the FruitDetail page using the "Presenter -> Wireframe" delegate.

```
 wireframe?.pushToFruitDetail(with: fruit, from: view)
```

* The ``` wireframe?.pushToFruitDetail(with: fruit, from: view)``` thus intialises the protocols used in the FruitDetail module by:
```
func pushToFruitDetail(with fruit: Fruit,from view: UIViewController) {
    let fruitDetailViewController = view.storyboard?.instantiateViewController(withIdentifier: "FruitDetailView") as! FruitDetailView
    FruitDetailWireFrame.createFruitDetailModule(with: fruitDetailViewController, and: fruit)
    view.navigationController?.pushViewController(fruitDetailViewController, animated: true)
    
  }
```

![Fruit Detail](https://github.com/GABHISEKBUNTY/Viper-Architecture/blob/master/FruitDetail.png)

I have created a separate module for FruitDetail inorder to make us clear how we can manage multiple modules in our code


That was a sweet travel along our small Diet plan. Looking back to our project structure, we can see that our project has become more modular and structurised.


## Presentation

I have a small presentation prepared regarding the VIPER architecture which you would love to have a peek into
[VIPER Presentation](https://www.slideshare.net/secret/8d94cguUVFyD9g). 


## Acknowledgment

* Adeesh Jain
* Avinash Kumar Gautam

