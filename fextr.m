function varargout = fextr(varargin)
% FEXTR M-file for fextr.fig
%      FEXTR, by itself, creates a new FEXTR or raises the existing
%      singleton*.
%
%      H = FEXTR returns the handle to a new FEXTR or the handle to
%      the existing singleton*.
%
%      FEXTR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FEXTR.M with the given input arguments.
%
%      FEXTR('Property','Value',...) creates a new FEXTR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fextr_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fextr_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fextr

% Last Modified by GUIDE v2.5 15-Jun-2012 02:07:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fextr_OpeningFcn, ...
                   'gui_OutputFcn',  @fextr_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before fextr is made visible.




function fextr_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fextr (see VARARGIN)

% Choose default command line output for fextr
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes fextr wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fextr_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


%EDGE DETECTION
%MODULE#####################################.................

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(h, eventdata,handles)
    k1= imread(uigetfile('*.tiff'));
   % global file_name;
 %file_name=getappdata(hObject,k1); 
 uisave('k1','k');
 
 
 %PushButton9 = uicontrol(pushbutton9,'pushbutton','CallBack', @pushbutton9_Callback);



% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit1,'String',0);
%axes(handles.axes1); 
%imshow(null);




% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%edge detection of gray matrix image with sobel operator%
%global d;
%global k;
load('k.mat');
d=rgb2gray(k1);
e1 = edge(d,'sobel');
axes(handles.axes1); 
imshow(e1);
title('sobel operator applied');


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%edge detection of gray matrix image with prewitt operator%
load('k.mat');
d=rgb2gray(k1);
e2 = edge(d,'prewitt');
axes(handles.axes1); 
imshow(e2);
title('prewitt opertaor applied');


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%edge detection of gray matrix image with robert operator%
load('k.mat');
d=rgb2gray(k1);
e3 = edge(d,'robert');
axes(handles.axes1); 
imshow(e3);
title('robert opertaor applied');


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%edge detection of gray matrix image with log operator%
load('k.mat');
d=rgb2gray(k1);
e4 = edge(d,'log');
axes(handles.axes1); 
imshow(e4);
title('log opertaor applied');


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%edge detection of gray matrix image with canny operator%
load('k.mat');
d=rgb2gray(k1);
e5 = edge(d,'canny');
axes(handles.axes1); 
imshow(e5);
title('canny opertaor applied');

% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%edge detection of gray matrix image with zerocross operator%
load('k.mat');
d=rgb2gray(k1);
e6 = edge(d,'zerocross');
axes(handles.axes1); 
imshow(e6);
title('zerocross opertaor applied');



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%SPATIAL FEATURES PLOTS####################################.....

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('k.mat');
d=rgb2gray(k1);
axes(handles.axes1); 
imhist(d);
title('histogram image');




% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('k.mat');
d=rgb2gray(k1);
%figure(8),histeq(d);
%title('histogram image');
axes(handles.axes1); 
imshow(histeq(d));
title('histogram image');



% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('k.mat');
d=rgb2gray(k1);
x=imhist(d);
x1=x(1:10:256);
b=1:10:256;
axes(handles.axes1); 
bar(b,x1);
title('bar graph of gray image');


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('k.mat');
d=rgb2gray(k1);
x=imhist(d);
x1=x(1:10:256);
b=1:10:256;
axes(handles.axes1); 
stem(b,x1);
title('stem graph of gray image');


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('k.mat');
d=rgb2gray(k1);
x=imhist(d);
x1=x(1:10:256);
b=1:10:256;
axes(handles.axes1); 
plot(b,x1);
title('plot graph of gray image');


%SPATIAL STATISTICS##############################################......................

% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Mean of image
load('k.mat');
a=mean2(k1);
set(handles.edit1,'String',a);


% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('k.mat');
std=std2(k1);
set(handles.edit1,'String',std);


% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('k.mat');
ske1=skewness(im2double(k1))*255;
ske2=skewness(im2double(ske1))*255;
ske=skewness(im2double(ske2))*255;
set(handles.edit1,'String',ske);


% --- Executes on button press in pushbutton27.
function pushbutton27_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('k.mat');
kur1=kurtosis(im2double(k1))*255;
kur2=kurtosis(im2double(kur1))*255;
kur=kurtosis(im2double(kur2))*255;
set(handles.edit1,'String',kur);


%TEXTURE FEATURES....................................


% --- Executes on button press in pushbutton29.
function pushbutton29_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('k.mat');
da=rangefilt(k1);
set(handles.edit1,'String',da);



% --- Executes on button press in pushbutton30.
function pushbutton30_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('k.mat');
dm=entropy(k1);
set(handles.edit1,'String',dm);


% --- Executes on button press in pushbutton31.
function pushbutton31_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('k.mat');
axes(handles.axes1);
dq=rangefilt(k1);
imshow(dq);
title('local range of image');
