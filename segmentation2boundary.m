function varargout = segmentation2boundary(varargin)
% SEGMENTATION2BOUNDARY MATLAB code for segmentation2boundary.fig
%      SEGMENTATION2BOUNDARY, by itself, creates a new SEGMENTATION2BOUNDARY or raises the existing
%      singleton*.
%
%      H = SEGMENTATION2BOUNDARY returns the handle to a new SEGMENTATION2BOUNDARY or the handle to
%      the existing singleton*.
%
%      SEGMENTATION2BOUNDARY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SEGMENTATION2BOUNDARY.M with the given input arguments.
%
%      SEGMENTATION2BOUNDARY('Property','Value',...) creates a new SEGMENTATION2BOUNDARY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before segmentation2boundary_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to segmentation2boundary_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help segmentation2boundary

% Last Modified by GUIDE v2.5 26-Jul-2017 20:39:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @segmentation2boundary_OpeningFcn, ...
                   'gui_OutputFcn',  @segmentation2boundary_OutputFcn, ...
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


% --- Executes just before segmentation2boundary is made visible.
function segmentation2boundary_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to segmentation2boundary (see VARARGIN)

% Choose default command line output for segmentation2boundary
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes segmentation2boundary wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = segmentation2boundary_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1
   contents = cellstr(get(hObject,'String'));
   contents{get(hObject,'Value')};
    

% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))

    set(hObject,'BackgroundColor','white');

end
folder_list = get_list_folders('../training/segmentation_viz/');
set(hObject,'Max',size(folder_list,1));
set(hObject,'Min',size(folder_list,1)-1);
set(hObject,'Value',1);
set(hObject,'String',folder_list);
guidata(hObject, handles);



% --------------------------------------------------------------------
function uitoggletool5_OffCallback(hObject, eventdata, handles)
% hObject    handle to uitoggletool5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function uitoggletool5_OnCallback(hObject, eventdata, handles)
% hObject    handle to uitoggletool5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function uitoggletool5_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uitoggletool5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2
    listbox1_handle = findobj('Tag', 'listbox1');
    index_selected = get(listbox1_handle,'Value');
    list = get(listbox1_handle,'String');
    item_selected = list{index_selected}; 
   
    handles.output = hObject;
    images_list = get_list_folders(strcat('../training/segmentation_viz/',item_selected));
    set(handles.listbox2,'String',images_list);
    image_index_selected = get(handles.listbox2,'Value');
    list_images = get(handles.listbox2,'String');
    if image_index_selected>=1
        image_selected = list_images{image_index_selected};
        im = imread(strcat('../training/segmentation_viz/',item_selected,'/',image_selected));
        im2 = imread(strcat('../training/clean/',item_selected,'/',image_selected));
        im3 = imread(strcat('../training/segmentation_viz_new/',item_selected,'/',image_selected));
        axes(handles.axes1);
        imshow(im);
        axes(handles.axes2);
        imshow(im2);
        axes(handles.axes3);
        imshow(im3);
        guidata(hObject, handles);
        x_old = 1;
        y_old = 1;
        if isgraphics(handles.axes1)
            while x_old > 0 && y_old > 0
             [y_old,x_old] = ginput;
             x_old = floor(x_old);
             y_old = floor(y_old);
             text7_handle = findobj('Tag', 'text7');
             text8_handle = findobj('Tag', 'text8');
             set(text7_handle,'String',num2str(x_old));
             set(text8_handle,'String',num2str(y_old));
             %axes5 old color
             R_old = im(x_old,y_old,1);
             G_old = im(x_old,y_old,2);
             B_old = im(x_old,y_old,3);
             rec_old = rectangle_color(R_old,G_old,B_old);
             axes(handles.axes5);
             imshow(rec_old./255);
             
             %
             [y_new,x_new] = ginput;
             x_new = floor(x_new);
             y_new = floor(y_new);
             text7_handle = findobj('Tag', 'text7');
             text8_handle = findobj('Tag', 'text8');
             set(text7_handle,'String',num2str(x_new));
             set(text8_handle,'String',num2str(y_new));
             %axes4 new color
             R_new = im(x_new,y_new,1);
             G_new = im(x_new,y_new,2);
             B_new = im(x_new,y_new,3);
             axes(handles.axes4);
             rec_new = rectangle_color(R_new,G_new,B_new);
             imshow(rec_new./255);
             new_color = [R_new,G_new,B_new];
             old_color = [R_old,G_old,B_old];
             change_color(strcat('../training/segmentation_viz_new/',item_selected,'/'),old_color,new_color);
            end
        end
    end
    
    

% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
