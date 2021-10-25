//
//  TheoryAns.swift
//  iOS-Assessment13
//
//  Created by Mohammad Talha on 25/10/21.
//

import Foundation

//---------------------------------What is URLSession?---------------------


//URLSession is the class responsible for making HTTP request and getting HTTP response. In a really simplified analogy,think
//of URLSession as a web browser and it can have multiple tabs opening multiple website. Those tabs which request and
//load website data are URLSessionTask. One URLSession can have multiple URLSessionTask send request to different website.


//We can create a instance of URLSession like this :

//let config = URLSessionConfiguration.default
//let session = URLSession(configuration: config)




//---------------------------What are types of URLSessionConfiguration?----------------

//URLSession instance is initialized using URLSessionConfiguration.
//URLSessionConfiguration has three types :

//1--> .default - The URLSession will save cache / cookie into disk, credentials are saved to keychain
//
//2--> .ephemeral - This is similar to opening Incognito mode on Chrome or Private browsing on Firefox / Safari, cache / cookie / credential are stored in memory and will be gone once the session is terminated
//
//3--> .background - This allow the session to perform upload / download task in the background, meaning even if the app is suspended (in background), the upload / download task will still continue.




//----------------------What is URLSessionTask?Explain Types of URLSessionTask?-------------------------



//URLSessionTask is the class responsible for making request to the web API and uploading / downloading data.
//
//There's 3 type of URLSessionTask :
//
//1--> URLSessionDataTask - Use this for sending HTTP GET / POST / PUT / DELETE request, the data retrieved from response
//is saved into Memory in NSData / Data form
//
//2--> URLSessionUploadTask - Use this for uploading file
//
//3--> URLSessionDownloadTask - Use this for downloading file



//Practical questions are implemented
