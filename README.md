# JKInteractivePushNotifications

A Sample project to demonstrate the operation of interactive Push notifications in iOS application.

![alt text][Interactive_push_with_multiple_action_buttons]
![alt text][Interactive_push_with_action_buttons_and_input_text_field]

[Interactive_push_with_multiple_action_buttons]: https://github.com/jayesh15111988/JKInteractivePushNotifications/blob/master/IMG_0321.PNG "Action Buttons"
<br/><br/>
[Interactive_push_with_action_buttons_and_input_text_field]: https://github.com/jayesh15111988/JKInteractivePushNotifications/blob/master/IMG_0322.PNG "Action Buttons and input text field"

> Detailed information on implementing interactive push notifications on iOS is explained in the following blog post:<br/>
**[Implementing Interactive push notifications on iOS](https://jayeshkawli.ghost.io/interactive-notifications-ios/)**

Note while sending interactive push notifications from server :

Since we have two identifiers viz. RegularButtonCategoryIdentifier and TextInputCategoryIdentifier in the app, make sure your payload looks like following. You must specify the category in payload which corresponds to the identifier declared while registering for interactive push notifications

{
    "aps" :  {
        "alert" : "Regular Button Category",
        "category" : "RegularButtonCategoryIdentifier"
    }
}

and

{
    "aps" :  {
        "alert" : "Text Input Category",
        "category" : "TextInputCategoryIdentifier"
    }
}

Note : Category value chosen other than these two will not work since we never registered to Apple push notification service with those identifiers.
