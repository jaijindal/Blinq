# Welcome to Blinq 

## Walkthrough of the Repository  

This is a submission for MLDA Deep Learning Week Hackathon. 

1) The [Main Code Folder](Main Code/) contains the main code used in flutter with all other functions integrated.
2) The [Presentation Folder](Presentation/) contains our PPT for project demonstration purposes.
3) The [Source Code Folder](Source Code/) contains the utility and helper functions. These are the raw codes across platforms with different functionalities that have been used to derive the main code.


## Problem Definition

In 2015, there were an estimated 253 million people with visual impairment worldwide. Of these, 36 million were blind and a further 217 million had moderate to severe visual impairment. In context of Singapore- the problem worsens as the risk of blindness increases fifteen-fold for aged 50 to 80 and above. As age steals away the senses, vision loss is perhaps the most devastating, as it increases the risk of falls, depression and even premature death. As Singapore moves towards establishing itself as a SMART Nation , it becomes absolutely imperative to provide practical solutions to those in need. 


## About The Project 

We have developed a SMART cane using arduino along with a technological assistive application (FLUTTER)  available for android and ios that works using spoken commands that allow the user to perform the 3 functions listed below: 

1) SMART Cane Obstacle Detection  

Our SMART Cane is equipped with Ultrasonic sensor (HC-SRO4) attached to the arduino and linked to mobile application via bluetooth (HC05) that detects any incoming obstacle in a 2 meter radius. This enables the user to be aware of any possible obstruction in his/her immediate surroundings while walking. Our SMART cane is also equipped with temperature and humidity sensor which warns the user of incoming temperature changes and rain. 

2) ML Live Environment Tracker

There are often instances when a visually impaired person might not have any idea of their surroundings and might need assistance in identifying nearby objects. Therefore our ML Live Environment Tracker enables the user to point the camera around him/her and the program will list down all objects in vicinty such as Cars, Trees, Pedestrians , Electronics , Stationery, Chairs etc through spoken command.


3) Tesseract Text Reader

We understand how it might be extremely frustrating for a visually impaired person to not be able to read notices / menus / food labels and hence we have developed a function that allows the user to point their phone camera at the object and ask the application to identify and read the text for them through spoken command.


## Future Scope

- ‘Fall Alert’ feature that uses accelerometer to detect when the user falls down, and automatically calls user’s emergency contact.
- Community feature that matches volunteers to users that might require help in certain situations such as travelling to the doctor and urgent assistance. 
- Inbuilt voice activated GPS system provided as an additional feature of the application. 
- Customizable component that can be used to fit the sensorboard device onto any cane efficiently. 
- An option to have a smart shoe as an alternative for users that do not wish to use a cane. 
- Improving the structure and design of the sensorboard for greater marketability.


## Modules Used

Flutter, Tensorflow, TFLite, Keras, Pandas, Tesseract OCR, Numpy, OpenCV, Flutter, HC05 Bluetooth module, DHT 11: Temperature and Humidity Sensor, Ultrasonic sensor (HC-SR04)


## References 

https://medium.flutterdevs.com/live-object-detection-app-with-flutter-and-tensorflow-lite-a6e7f7af3b07
https://viso.ai/deep-learning/yolov3-overview/
https://github.com/hiennguyen92/flutter_realtime_object_detection
https://blog.devgenius.io/recognize-text-on-an-image-in-flutter-c8da05fe043e
https://pub.dev/packages/tflite#Object-Detection
https://www.thingiverse.com/thing:3318918

