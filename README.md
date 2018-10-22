# How to ask User for Appstore Reviews in iOS

Simple download the AppstoreReviewHandler.swift and import it to your project. 

## 3 simpleSteps are needed to get it working.

### Step1: 
Set to number of applaunches after you want the user ask for a review in AppstoreReviewHandler like this: 

``` 
private let MINIMUM_APP_LAUNCHES_UNTIS_FIRST_REQUEST = 3 
```


### Step2: 
In your AppDelegate track applaunches 

```
func applicationWillEnterForeground(_ application: UIApplication) {
        AppstoreReviewHandler().recordAppLaunch()
}
```


### Step3: 
Anywhere in your app where you want to ask your user for a review simply call 
```
AppstoreReviewHandler().tryToGetAppstoreReview()
```
