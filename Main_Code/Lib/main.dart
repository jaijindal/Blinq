import 'package:blinqfinal/bluetoothModule/ChatPage.dart';
import 'package:blinqfinal/bluetoothModule/MainPage.dart';
import 'package:blinqfinal/cameraPage.dart';
import 'package:blinqfinal/readPage.dart';
// import 'package:blinq/read.dart';
import 'package:camera/camera.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stts;


// List<CameraDescription> cameras = [];
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // cameras = await availableCameras();
  runApp(const MyApp());
}

// const String mobile = "MobileNet";
// const String ssd = "SSD MobileNet";
// const String yolo = "Tiny YOLOv2";
// const String deeplab = "DeepLab";
// const String posenet = "PoseNet";


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: ' B L I N Q ',
      theme: ThemeData(
        
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: ' B L I N Q ',),
      // home: MainPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var _speechToText = stts.SpeechToText();
  bool isListening = false;
  String text = "Ask";

  final FlutterTts flutterTts = FlutterTts();
  final TextEditingController textEditingController = TextEditingController();

  

  void speak(String text2)async{
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.speak(text2);
  }


void speakSpecificWords(String text3)async{
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.speak(text3);
  }
 


  

  void listen() async{

    if(!isListening){

      bool available = await _speechToText.initialize(
        onStatus: (status)=>print("$status"),
        onError: (errorNotification)=>print(errorNotification),

      );
      if(available){
        setState(() {
          isListening = true;
        });
        _speechToText.listen(
          onResult: (result)=>setState(() {
            text = result.recognizedWords;
          })
        );
      }
    }else{
      setState(() {
        isListening = false;
      });
      _speechToText.stop();
    }

  }

  List labels = ["temperature","scan","detect","help","read"];

  logic(String label)async{

    

    if(labels.contains(label.toLowerCase())){
      switch (label) {
        case "temperature":
          // print(externalMessages[0]);
          speak("It is currently 26 degrees");
          break;
        case "scan":
          speak("now opening the scanner");
          Navigator.push(context,MaterialPageRoute(builder: (context)=>ReadPage()));
          break;
        case "detect":
          speak("now opening the camera");
          Navigator.push(context,MaterialPageRoute(builder: (context)=>CameraPage()));
          break;

        case "what is around me":
          speak("now opening the camera");
          Navigator.push(context,MaterialPageRoute(builder: (context)=>CameraPage()));
          break;

        case "help":
          speak("now connecting you to a helper");
          Navigator.push(context,MaterialPageRoute(builder: (context)=>CameraPage()));
          break;

        case "humidity":
          // do something else
          break;

      }
    }else{
      print("We faced an error, please try again!");
    }

    

    
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _speechToText = stts.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        title: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
          },
          child: Text(widget.title,style: TextStyle(color: Colors.white),)),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Center(
       
        child: Row(
          children:[
            Expanded(
              flex:1,
              child: Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ReadPage()));
                        },
                        child: Container(
                          color: Colors.red,
                          child: Center(child: Text("Read", style:TextStyle(fontWeight:FontWeight.bold,fontSize:20.0)))
                          ),
                      ),

                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CameraPage()));
                        },
                        child: Container(
                          color: Colors.green,
                          child: Center(child: Text("See", style:TextStyle(fontWeight:FontWeight.bold,fontSize:20.0)))
                          ),
                      ),

                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>CameraPage()));
                        },
                        child: Container(
                          color: Colors.yellow,
                          child: Center(child: Text("Help", style:TextStyle(fontWeight:FontWeight.bold,fontSize:20.0)))
                          ),
                      ),

                    ),
                  ],
                )
              )
            ),

            Expanded(
              flex:1,
              child: GestureDetector(
                onTapDown: (_){
                  // speakSpecificWords("start speaking now!");
                  listen();
                  print("Hello");
                },
                onTapUp: (_){
                  if(labels.contains(text.toLowerCase())){
                    return logic(text.toLowerCase());
                  }else{
                    print(text);
                  speak(text);
                  }
                  
                  print("bye");
                  // text = "";
                },
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.blue,
                  child: Center(child: Text(text, style:TextStyle(fontWeight:FontWeight.bold,fontSize:20.0)))
                ),
              )
            ),

          ]
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


// void getImageLabels(XFile image) async {
// final inputImage = InputImage.fromFilePath(image.path);
// ImageLabeler imageLabeler = ImageLabeler(options: ImageLabelerOptions());
// List<ImageLabel> labels = await imageLabeler.process Image(input Image);
// StringBuffer sb = StringBuffer();
// for (ImageLabel imgLabel in labels) {
// String lblText = imgLabel.label;
// double confidence = imgLabel.confidence;
// sb.write(lblText);
// sb.write(" : ");
// sb.write((confidence * 100).toStringAsFixed(2));
// sb.write("%");
// }
// imageLabeler.close();
// imageLabel = sb.toString();
// imageLabelChecking = false;
// setState(() );
// }}
