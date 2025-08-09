### Step 1. Install FFMPEG

- Open this in browser : https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-gpl.zip
- It will download a file . 
- Now go to downloads folder : extract this  zip file you will see a new folder named : 
-  Now go to that folder the you will get three exe files . 
- Press Ctrl + A then press Ctrl + C .
- Now press Windows button + E on keyboard .
- On left bottom side of bar you will see C & D drive . 
- Click on that C drive option . 
- Now once you get into C drive . Right click on mouse or press right button of touchpad of laptop . 
- You will get option New with + icon . Click or hover up to that New option .
- You will get Folder option . Click on folder option   then you will get an option to create folder and a folder will appear at end new folder . Type tools . 
- Now you have a folder named tools .
- Go inside that folder.  and press ctrl + v . 
- Now you have all the 3 .exe files of ffmpeg inside that folder . 
- Now press windows button on keyboard then type : Advanced system settings . 
- You will see option : View Advanced System Settings 
- Now click on Environment Variables button 
- Now you will see two variables : User variables and System variables 
- You will see Path option 
- Double click on it . 
- Click on edit , now type that C:\tools & then create another one by clicking New that C:\tools\  . 
- Click on  OK . 
- Now again click on OK . 
- Now again click on OK. 
- Now again press windows click on and type Powershell . 
- And then type ffmpeg -version . You will get version details . 
- Once confirmed , you have installed ffmpeg . 


### Step 2. Download this Sharepoint Downloader Extension 

- Now visit this link in your browser : https://github.com/MexxDirkx/SharePoint-Video-Downloader-Extension
- Click on green button named "Code". 
- You will get option to "Download as ZIP".
- Now you will see that zip file get downloaded .  
- Extract the zip file . 
- Now you will see the another folder named Sharepoint Downloader Extension. 
- Now in browser press Ctrl + T . then type this chrome://extension.  
- Now at right top button you will see "Developer Mode" . Turn on that developer mode . 
- Now click on left top at Load unpacked . 
- Go the folder where it was extracted and all the content is present . 
- Most probably this will be path : 

- *_C:\User\Name Sharepoint-Video-Downloader-Extension\SharePoint-Video-Downloader-Extension-main\SharePoint-Video-Downloader-Extension-main_*  

- Now click on Select folder . 
- Now you will get Sharepoint Video Downloader extension . 
- Once you will get extension loaded . 
- Go to upsifs video url . 
- Now you will see extension icon below minimize button . 
- Click on it . You will click on sharepoint downloader . 
- Now click on detect video . 
- Now click on Copy FFMPEG command . 
- Now click on Copy to Clipboard .
- Now again open Powershell . 
- Paste that script by Ctrl + V  on powershell .
- Your video will get downloaded . 



## FOR PROGRESS BAR & TIMESTAMP 


- If you want to know about progress or about total time left to download or total percentage downloaded . , you need to install python in your system . 
- Once installed , run this command , 
```
pip3 install ffmpeg-progress-yield
```
- Then download this script which I have developed for progress bar . 
- Visit this repo https://github.com/gigachad80/Sharepoint-Video-Download-Progress-Bar-Guide-
- Download the zip file  . Extract it by right clicking . 
- Now you will get a text file named "downloads.txt" . 
- Follow the same steps ( Detect video , Copy ffmpeg command , copy to clipboard)
- Now paste that manifest URL which you copied in downloads.txt. If you want to downloadd all videos in one go , then paste all manifest URLs in that downloads.txt
- Remove double quotes " from each URL , you will find this at starting of url as well as in the end 
- For e.g : ffmpeg -i "https://.................mp4"
- Also remove this part  which you will find before course title name .


```
" -codec copy "./
```
- Also remove ffmpeg -i from each urls . 

```
ffmpeg -i
```
- To save time , you can also remove all at once simply byt pressing Ctrl + H , after that you will get two tabs :
- On the first box you have to type the word which you want to remove  , and second box will be the word which you want to replace 
- In first , type ffmpeg -i then in second  , just press space bar . Now click on replace all option . 
- Same do with 
```
" -codec copy "./
```
- Replace it with 
by pressing . | 
- Once removed , the final format of URL will look like this : 

```
https://...................=Access&part=index&format=dash|<Course name.mp4>
```
- Now after pasting all the manifest URLs . 
- Now open powershell , go to the folder where you have that downloads.txt . Then type ./batch and enter tab , you will get name of powershell script . 
- Type enter and you are good to go . 
- Now you are downloading all the videos as well as you are seeing the % downloaded and left and total time it will take to download full . 
- The video will be in the folder named : - All Lectures
