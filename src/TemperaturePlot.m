%------------------- Create in Matlab R2016b -------------------------
%_____________________________________________________________________
%------------------- Update in Matlab R2018b -------------------------
%---------------------------------------------------------------------
%
%----------------- For version LTU_TO changed: -----------------------

% *1) File name EXCEL table (add _TO)
% *2) Udpate time from EXCEL table
% *3) Resourse value writing (via point) - FIXED
%---------------------------------------------------------------------



function varargout = TemperaturePlot(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TemperaturePlot_OpeningFcn, ...
                   'gui_OutputFcn',  @TemperaturePlot_OutputFcn, ...
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

function TemperaturePlot_OpeningFcn(hObject, eventdata, handles, varargin)



handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

tg_CreateFcn(hObject, eventdata, handles); %%%%%%%%%%%%%%%%%%% MYYYY

%a = findall(gcf)



function varargout = TemperaturePlot_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;



function myMain
  waitfor(TemperaturePlot)


%------------------- TabGroup initiation ----------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function tg_CreateFcn(hObject, eventdata, handles)

global tabgp;
global tab1_tabgp;
global tab2_tabgp;
global tab3_tabgp;
global tab4_tabgp;
global tab5_tabgp;
global ax_bar;
global bar_screen_frame;
global sec_cnt;
global ax_SU;
global ax_orig_img;
global ax_proc_img;
global ax_bw_img;


tabgp = uitabgroup('Parent', gcf, 'Units', 'Characters', 'Position', [199.8 42.53846153846154 161.5 26.9], 'HandleVisibility', 'On');
tab1_tabgp = uitab('Parent', tabgp, 'Title','Bar Webcam', 'HandleVisibility', 'On');
tab3_tabgp = uitab('Parent', tabgp, 'Title','Bar Recognize', 'HandleVisibility', 'On');
tab4_tabgp = uitab('Parent', tabgp, 'Title','Shot Counter', 'HandleVisibility', 'On');
tab2_tabgp = uitab('Parent', tabgp, 'Title','Settings', 'HandleVisibility', 'On');
tab5_tabgp = uitab('Parent', tabgp, 'Title','EXCEL', 'HandleVisibility', 'On');
set(tabgp, 'Visible', 'Off');

ax_bar = axes('Parent', tab1_tabgp, 'HandleVisibility', 'On');
set(ax_bar, 'XTickLabel','');
set(ax_bar, 'YTickLabel','');
set(ax_bar, 'Units', 'Characters', 'Position', [2.1 1.1 85.0 22.3]);

% WEBCAM pannel properities
handles.check_bar = uicontrol(gcf, 'Style','checkbox', 'Parent', tab1_tabgp, ...
                    'String', 'Check BAR', 'Value', 0, 'HandleVisibility', 'On', ...
                    'Units', 'Characters', 'Position', [89 16 20.0 1.7], ...
                    'Fontsize', 9, 'Tag', 'check_bar', ...
                    'Callback', @(hObject,eventdata)TemperaturePlot('check_bar_Callback',hObject,eventdata,guidata(hObject)));
                
handles.check_barrec = uicontrol(gcf, 'Style','checkbox', 'Parent', tab1_tabgp, ...
                    'String', 'Recognize', 'Value', 0, 'HandleVisibility', 'On', ...
                    'Units', 'Characters', 'Position', [89 12.5 20.0 1.7], ...
                    'Fontsize', 9, 'Tag', 'check_barrec', ...
                    'Callback', @(hObject,eventdata)TemperaturePlot('check_barrec_Callback',hObject,eventdata,guidata(hObject)));
                
handles.pm_camlist = uicontrol(gcf, 'Style','popupmenu', 'Parent', tab1_tabgp, ...
                    'String', {''}, ...
                    'HandleVisibility', 'On', 'Tag', 'pm_camlist',...
                    'Units', 'Characters', 'Position', [89 19 68.0 1.5], ...
                    'Fontsize', 8, 'Value', 1, 'Enable', 'On');
               
handles.pm_frame_bar = uicontrol(gcf, 'Style', 'popupmenu', 'Parent', tab1_tabgp, ...
                         'String', {'5 sec'; '10 sec'; '20 sec'; '30 sec'; '1 min'; '3 min'; '5 min'}, ...
                         'HandleVisibility', 'On', 'Tag', 'pm_frame_bar',...
                         'Units', 'Characters', 'Position', [143 16 14 1.7], ...
                         'Fontsize', 9, 'Value', 4, ...
                         'Enable', 'Off', ...
                         'Callback', @(hObject,eventdata)TemperaturePlot('pm_frame_bar_Callback',hObject,eventdata,guidata(hObject)));
                     
handles.barprestab1_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab1_tabgp, ...
                                 'String', 'Bar pressure', 'FontWeight', 'bold',...
                                 'HandleVisibility', 'On', 'Tag', 'barprestab1_lbl',...
                                 'Units', 'Characters', 'Position', [89.0 10.5 68 1.7], ...
                                 'Fontsize', 12, 'HorizontalAlignment', 'center', ...
                                 'BackgroundColor', [0.9 0.9 0.9], 'ForegroundColor', 'k');
                             
handles.channeltab1_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab1_tabgp, ...
                                 'String', 'Channel', 'FontWeight', 'bold', ...
                                 'HandleVisibility', 'On', 'Tag', 'channeltab1_lbl',...
                                 'Units', 'Characters', 'Position', [90.0 8.5 12 1.5], ...
                                 'Fontsize', 10, 'HorizontalAlignment', 'center', ...
                                 'BackgroundColor', [0.94 0.94 0.94], 'ForegroundColor', 'b');
                             
handles.modetab1_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab1_tabgp, ...
                                 'String', 'Mode', 'FontWeight', 'bold', ...
                                 'HandleVisibility', 'On', 'Tag', 'modetab1_lbl',...
                                 'Units', 'Characters', 'Position', [106.5 8.5 10 1.5], ...
                                 'Fontsize', 10, 'HorizontalAlignment', 'center', ...
                                 'BackgroundColor', [0.94 0.94 0.94], 'ForegroundColor', 'b');
                             
handles.barvaluetab1_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab1_tabgp, ...
                                 'String', 'Value', 'FontWeight', 'bold', ...
                                 'HandleVisibility', 'On', 'Tag', 'barvaluetab1_lbl',...
                                 'Units', 'Characters', 'Position', [122.0 8.5 35 1.5], ...
                                 'Fontsize', 10, 'HorizontalAlignment', 'center', ...
                                 'BackgroundColor', [0.94 0.94 0.94], 'ForegroundColor', 'b');
                             
handles.ch1tab1_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab1_tabgp, ...
                                 'String', '', 'FontWeight', 'bold', ...
                                 'HandleVisibility', 'On', 'Tag', 'ch1tab1_lbl',...
                                 'Units', 'Characters', 'Position', [91.0 5 10 3], ...
                                 'Fontsize', 24, 'HorizontalAlignment', 'right', ...
                                 'BackgroundColor', [0.9290 0.6940 0.1250], 'ForegroundColor', 'k');
                             
handles.ch2tab1_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab1_tabgp, ...
                                 'String', '', 'FontWeight', 'bold', ...
                                 'HandleVisibility', 'On', 'Tag', 'ch2tab1_lbl',...
                                 'Units', 'Characters', 'Position', [91.0 1.4 10 3], ...
                                 'Fontsize', 24, 'HorizontalAlignment', 'right', ...
                                 'BackgroundColor', [0.9290 0.6940 0.1250], 'ForegroundColor', 'k');
                             
handles.mode1tab1_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab1_tabgp, ...
                                 'String', '', 'FontWeight', 'bold', ...
                                 'HandleVisibility', 'On', 'Tag', 'mode1tab1_lbl',...
                                 'Units', 'Characters', 'Position', [106.5 5 10 3], ...
                                 'Fontsize', 24, 'HorizontalAlignment', 'right', ...
                                 'BackgroundColor', [0.9290 0.6940 0.1250], 'ForegroundColor', 'k');
                             
handles.mode2tab1_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab1_tabgp, ...
                                 'String', '', 'FontWeight', 'bold', ...
                                 'HandleVisibility', 'On', 'Tag', 'mode2tab1_lbl',...
                                 'Units', 'Characters', 'Position', [106.5 1.4 10 3], ...
                                 'Fontsize', 24, 'HorizontalAlignment', 'right', ...
                                 'BackgroundColor', [0.9290 0.6940 0.1250], 'ForegroundColor', 'k');
                             
handles.barval1tab1_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab1_tabgp, ...
                                 'String', '', 'FontWeight', 'bold', ...
                                 'HandleVisibility', 'On', 'Tag', 'barval1tab1_lbl',...
                                 'Units', 'Characters', 'Position', [122.0 5 35 3], ...
                                 'Fontsize', 24, 'HorizontalAlignment', 'right', ...
                                 'BackgroundColor', [0.9290 0.6940 0.1250], 'ForegroundColor', 'k');
                             
handles.barval2tab1_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab1_tabgp, ...
                                 'String', '', 'FontWeight', 'bold', ...
                                 'HandleVisibility', 'On', 'Tag', 'barval2tab1_lbl',...
                                 'Units', 'Characters', 'Position', [122.0 1.4 35 3], ...
                                 'Fontsize', 24, 'HorizontalAlignment', 'right', ...
                                 'BackgroundColor', [0.9290 0.6940 0.1250], 'ForegroundColor', 'k');
     
bar_screen_frame = 60;                     
                     
handles.text_av_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab1_tabgp, ...
                               'String', 'Available web-camera:', ...
                               'HandleVisibility', 'On', 'Tag', 'text_av_lbl',...
                               'Units', 'Characters', 'Position', [89 21 30.0 1.7], ...
                               'Fontsize', 9, 'HorizontalAlignment', 'left');
                           
handles.text_camname_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab1_tabgp, ...
                               'String', 'Cameraname', ...
                               'HandleVisibility', 'On', 'Tag', 'text_camname_lbl',...
                               'Units', 'Characters', 'Position', [125 21 32.0 1.7], ...
                               'Fontsize', 9, 'HorizontalAlignment', 'right', ...
                               'ForegroundColor', 'b', 'BackgroundColor', [0.94 0.94 0.94]);
                           
handles.bar_scrfrane_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab1_tabgp, ...
                               'String', 'Choose frame time:', ...
                               'HandleVisibility', 'On', 'Tag', 'bar_scrfrane_lbl',...
                               'Units', 'Characters', 'Position', [118 15.7 25.0 1.7], ...
                               'Fontsize', 9, 'HorizontalAlignment', 'left');
                           
                           
% Statistic pannel properities
handles.btn_helloworld = uicontrol(gcf, 'Style','pushbutton', 'Parent', tab2_tabgp, ...
                        'String', 'Hello, World', 'HandleVisibility', 'On', ...
                        'Units', 'Characters', 'Position', [2 22 20.0 1.7], ...
                        'Fontsize', 9, 'Tag', 'btn_helloworld', ...
                        'Callback', @(hObject,eventdata)TemperaturePlot('btn_helloworld_Callback',hObject,eventdata,guidata(hObject)));
                
handles.helloworld_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab2_tabgp, ...
                         'String', '', ...
                         'HandleVisibility', 'On', 'Tag', 'helloworld_lbl',...
                         'Units', 'Characters', 'Position', [27 22 50.0 1.6], ...
                         'Fontsize', 9, 'HorizontalAlignment', 'left', ...
                         'BackgroundColor', [0.9 0.9 0.9], 'ForegroundColor', 'b');
                     
handles.helloworld_lbl_clc = uicontrol(gcf, 'Style', 'text', 'Parent', tab2_tabgp, ...
                         'String', 'Любишь кнопочки тыкать - люби и за собой стирать!', ...
                         'HandleVisibility', 'On', 'Tag', 'helloworld_lbl_clc',...
                         'Units', 'Characters', 'Position', [4 19.5 70.0 1.6], ...
                         'Fontsize', 9, 'HorizontalAlignment', 'left', ...
                         'BackgroundColor', [0.94 0.94 0.94], 'ForegroundColor', 'b');
                           
handles.btn_helloworld_clc = uicontrol(gcf, 'Style','pushbutton', 'Parent', tab2_tabgp, ...
                        'String', 'Clear', 'HandleVisibility', 'On', ...
                        'Units', 'Characters', 'Position', [81 22 12.0 1.7], ...
                        'Fontsize', 9, 'Tag', 'btn_helloworld_clc', ...
                        'Callback', @(hObject,eventdata)TemperaturePlot('btn_helloworld_clc_Callback',hObject,eventdata,guidata(hObject)));
                    
handles.btn_stat1 = uicontrol(gcf, 'Style','pushbutton', 'Parent', tab2_tabgp, ...
                        'String', 'Users statistic', 'HandleVisibility', 'On', ...
                        'Units', 'Characters', 'Position', [97 22 26.0 1.7], ...
                        'Fontsize', 9, 'Tag', 'btn_stat1', 'Visible', 'Off', ...
                        'Callback', @(hObject,eventdata)TemperaturePlot('btn_stat1_Callback',hObject,eventdata,guidata(hObject)));
                    
handles.btn_stat2 = uicontrol(gcf, 'Style','pushbutton', 'Parent', tab2_tabgp, ...
                        'String', 'Commands statistic', 'HandleVisibility', 'On', ...
                        'Units', 'Characters', 'Position', [97 20.0 26.0 1.7], ...
                        'Fontsize', 9, 'Tag', 'btn_stat2', 'Visible', 'Off', ...
                        'Callback', @(hObject,eventdata)TemperaturePlot('btn_stat2_Callback',hObject,eventdata,guidata(hObject)));
                    
handles.btn_exitstat = uicontrol(gcf, 'Style','pushbutton', 'Parent', tab2_tabgp, ...
                        'String', 'Exit Super User', 'HandleVisibility', 'On', ...
                        'Units', 'Characters', 'Position', [97 18 26.0 1.7], ...
                        'Fontsize', 9, 'Tag', 'btn_exitstat', 'Visible', 'Off', ...
                        'Callback', @(hObject,eventdata)TemperaturePlot('btn_exitstat_Callback',hObject,eventdata,guidata(hObject)));
                    
ax_SU = axes('Parent', tab2_tabgp, 'HandleVisibility', 'On', ...
            'XTickLabel', '', 'YTickLabel','', ...
            'Units', 'Characters', 'Position', [128.0 9.5 29.0 14.5], ...
            'Visible', 'Off');

sec_cnt = 0;


% File choose properities (setting pannel)
rev = 1.7;
handles.btn_TempLog = uicontrol(gcf, 'Style','pushbutton', 'Parent', tab2_tabgp, ...
                        'String', 'Choose OWEN log', 'HandleVisibility', 'On', ...
                        'Units', 'Characters', 'Position', [2 1+rev 25.0 1.7], ...
                        'Fontsize', 9, 'Tag', 'btn_TempLog', 'HorizontalAlignment', 'left', ...
                        'Callback', @(hObject,eventdata)TemperaturePlot('btn_TempLog_Callback',hObject,eventdata,guidata(hObject)));

handles.btn_EXCELLog = uicontrol(gcf, 'Style','pushbutton', 'Parent', tab2_tabgp, ...
                        'String', 'Choose EXCEL table', 'HandleVisibility', 'On', ...
                        'Units', 'Characters', 'Position', [2 3.1+rev 25.0 1.7], ...
                        'Fontsize', 9, 'Tag', 'btn_EXCELLog', 'HorizontalAlignment', 'left', ...
                        'Callback', @(hObject,eventdata)TemperaturePlot('btn_EXCELLog_Callback',hObject,eventdata,guidata(hObject)));
                    
handles.btn_LabmaxLog = uicontrol(gcf, 'Style','pushbutton', 'Parent', tab2_tabgp, ...
                        'String', 'Choose LabMax log', 'HandleVisibility', 'On', ...
                        'Units', 'Characters', 'Position', [2 5.2+rev 25.0 1.7], ...
                        'Fontsize', 9, 'Tag', 'btn_LabmaxLog', 'HorizontalAlignment', 'left', ...
                        'Callback', @(hObject,eventdata)TemperaturePlot('btn_LabmaxLog_Callback',hObject,eventdata,guidata(hObject)));

handles.EXCELcpath_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab2_tabgp, ...
                                 'String', '', ...
                                 'HandleVisibility', 'On', 'Tag', 'EXCELcpath_lbl',...
                                 'Units', 'Characters', 'Position', [29 3.1+rev 115 1.5], ...
                                 'Fontsize', 8, 'HorizontalAlignment', 'left', ...
                                 'BackgroundColor', [0.9 0.9 0.9], 'ForegroundColor', 'b');
                             
handles.Tempcpath_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab2_tabgp, ...
                                 'String', '', ...
                                 'HandleVisibility', 'On', 'Tag', 'Tempcpath_lbl',...
                                 'Units', 'Characters', 'Position', [29 1.1+rev 101 1.5], ...
                                 'Fontsize', 8, 'HorizontalAlignment', 'left', ...
                                 'BackgroundColor', [0.9 0.9 0.9], 'ForegroundColor', 'b');
                             
handles.Labmaxcpath_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab2_tabgp, ...
                                 'String', '', ...
                                 'HandleVisibility', 'On', 'Tag', 'Labmaxcpath_lbl',...
                                 'Units', 'Characters', 'Position', [29 5.2+rev 115 1.5], ...
                                 'Fontsize', 8, 'HorizontalAlignment', 'left', ...
                                 'BackgroundColor', [0.9 0.9 0.9], 'ForegroundColor', 'b');
                             
handles.ErrorStr_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab2_tabgp, ...
                                 'String', 'ERROR log:', ...
                                 'HandleVisibility', 'On', 'Tag', 'ErrorStr_lbl',...
                                 'Units', 'Characters', 'Position', [2 0.4 15 1.5], ...
                                 'Fontsize', 9, 'HorizontalAlignment', 'left', ...
                                 'BackgroundColor', [0.9 0.9 0.9], 'ForegroundColor', 'b');
                             
handles.ErrorLog_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab2_tabgp, ...
                                 'String', '', ...
                                 'HandleVisibility', 'On', 'Tag', 'ErrorLog_lbl',...
                                 'Units', 'Characters', 'Position', [19 0.4 139 1.5], ...
                                 'Fontsize', 9, 'HorizontalAlignment', 'left', ...
                                 'BackgroundColor', [0.9 0.9 0.9], 'ForegroundColor', 'r');
                             
handles.EXCELenable_check = uicontrol(gcf, 'Style','checkbox', 'Parent', tab2_tabgp, ...
                        'String', 'Enable', 'Value', 1, 'HandleVisibility', 'On', ...
                        'Units', 'Characters', 'Position', [146 3.1+rev 12.0 1.7], ...
                        'Fontsize', 9, 'Tag', 'EXCELenable_check');
                    
handles.TempUpdate_check = uicontrol(gcf, 'Style','checkbox', 'Parent', tab2_tabgp, ...
                        'String', 'Search', 'Value', 1, 'HandleVisibility', 'On', ...
                        'Units', 'Characters', 'Position', [132 1.0+rev 12.0 1.7], ...
                        'Fontsize', 9, 'Tag', 'TempUpdate_check');
                    
handles.TempEnable_check = uicontrol(gcf, 'Style','checkbox', 'Parent', tab2_tabgp, ...
                        'String', 'Enable', 'Value', 1, 'HandleVisibility', 'On', ...
                        'Units', 'Characters', 'Position', [146 1.0+rev 12.0 1.7], ...
                        'Fontsize', 9, 'Tag', 'TempEnable_check');
                    
handles.Labmaxenable_check = uicontrol(gcf, 'Style','checkbox', 'Parent', tab2_tabgp, ...
                        'String', 'Enable', 'Value', 1, 'HandleVisibility', 'On', ...
                        'Units', 'Characters', 'Position', [146 5.2+rev 12.0 1.7], ...
                        'Fontsize', 9, 'Tag', 'Labmaxenable_check');
                    
handles.razdel_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab2_tabgp, ...
                                 'String', '', ...
                                 'HandleVisibility', 'On', 'Tag', 'razdel_lbl',...
                                 'Units', 'Characters', 'Position', [1 9 158 0.2], ...
                                 'Fontsize', 9, 'HorizontalAlignment', 'left', ...
                                 'BackgroundColor', [0.8 0.8 0.8], 'ForegroundColor', 'b'); 
                             
handles.razdelup_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab2_tabgp, ...
                                 'String', '', ...
                                 'HandleVisibility', 'On', 'Tag', 'razdelup_lbl',...
                                 'Units', 'Characters', 'Position', [1 19.5 92 0.2], ...
                                 'Fontsize', 9, 'HorizontalAlignment', 'left', ...
                                 'BackgroundColor', [0.8 0.8 0.8], 'ForegroundColor', 'b'); 

% BAR Recognize pannel properities
%---------------------------------

ww = 55;

handles.orig_img_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab3_tabgp, ...
                                 'String', 'Original snapshot', ...
                                 'HandleVisibility', 'On', 'Tag', 'orig_img_lbl',...
                                 'Units', 'Characters', 'Position', [1.0 22.5 ww 1.4], ...
                                 'Fontsize', 9, 'HorizontalAlignment', 'center', ...
                                 'BackgroundColor', [0.9 0.9 0.9], 'ForegroundColor', 'b');
                             
handles.proc_img_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab3_tabgp, ...
                                 'String', 'Intermediate processing', ...
                                 'HandleVisibility', 'On', 'Tag', 'proc_img_lbl',...
                                 'Units', 'Characters', 'Position', [1.0 10.5 ww 1.4], ...
                                 'Fontsize', 9, 'HorizontalAlignment', 'center', ...
                                 'BackgroundColor', [0.9 0.9 0.9], 'ForegroundColor', 'b');
                             
handles.bw_img_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab3_tabgp, ...
                                 'String', 'BW image', ...
                                 'HandleVisibility', 'On', 'Tag', 'bw_img_lbl',...
                                 'Units', 'Characters', 'Position', [58.0 22.5 ww 1.4], ...
                                 'Fontsize', 9, 'HorizontalAlignment', 'center', ...
                                 'BackgroundColor', [0.9 0.9 0.9], 'ForegroundColor', 'b');
                             
handles.barpres_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab3_tabgp, ...
                                 'String', 'Bar pressure', 'FontWeight', 'bold',...
                                 'HandleVisibility', 'On', 'Tag', 'barpres_lbl',...
                                 'Units', 'Characters', 'Position', [58.0 10.5 ww 1.4], ...
                                 'Fontsize', 11, 'HorizontalAlignment', 'center', ...
                                 'BackgroundColor', [0.9 0.9 0.9], 'ForegroundColor', 'k');

handles.edge_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab3_tabgp, ...
                                 'String', '', ...
                                 'HandleVisibility', 'On', 'Tag', 'edge_lbl',...
                                 'Units', 'Characters', 'Position', [114.3 0.8 0.4 23.2], ...
                                 'Fontsize', 9, 'HorizontalAlignment', 'center', ...
                                 'BackgroundColor', [0.8 0.8 0.8], 'ForegroundColor', 'k');
                                      
handles.channel_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab3_tabgp, ...
                                 'String', 'Channel', 'FontWeight', 'bold', ...
                                 'HandleVisibility', 'On', 'Tag', 'channel_lbl',...
                                 'Units', 'Characters', 'Position', [58.0 8.5 15 1.4], ...
                                 'Fontsize', 10, 'HorizontalAlignment', 'center', ...
                                 'BackgroundColor', [0.9 0.9 0.9], 'ForegroundColor', 'b');
                             
handles.value_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab3_tabgp, ...
                                 'String', 'Value', 'FontWeight', 'bold', ...
                                 'HandleVisibility', 'On', 'Tag', 'value_lbl',...
                                 'Units', 'Characters', 'Position', [75.0 8.5 38 1.4], ...
                                 'Fontsize', 10, 'HorizontalAlignment', 'center', ...
                                 'BackgroundColor', [0.9 0.9 0.9], 'ForegroundColor', 'b');

handles.ch1_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab3_tabgp, ...
                                 'String', '', 'FontWeight', 'bold', ...
                                 'HandleVisibility', 'On', 'Tag', 'ch1_lbl',...
                                 'Units', 'Characters', 'Position', [58.0 5 7 3], ...
                                 'Fontsize', 24, 'HorizontalAlignment', 'right', ...
                                 'BackgroundColor', [0.9290 0.6940 0.1250], 'ForegroundColor', 'k');  
                             
handles.ch2_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab3_tabgp, ...
                                 'String', '', 'FontWeight', 'bold', ...
                                 'HandleVisibility', 'On', 'Tag', 'ch2_lbl',...
                                 'Units', 'Characters', 'Position', [58.0 1.5 7 3], ...
                                 'Fontsize', 24, 'HorizontalAlignment', 'right', ...
                                 'BackgroundColor', [0.9290 0.6940 0.1250], 'ForegroundColor', 'k');  
                            
handles.mode1_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab3_tabgp, ...
                                 'String', '', 'FontWeight', 'bold', ...
                                 'HandleVisibility', 'On', 'Tag', 'mode1_lbl',...
                                 'Units', 'Characters', 'Position', [66.0 5 7 3], ...
                                 'Fontsize', 24, 'HorizontalAlignment', 'right', ...
                                 'BackgroundColor', [0.9290 0.6940 0.1250], 'ForegroundColor', 'k');
                             
handles.mode2_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab3_tabgp, ...
                                 'String', '', 'FontWeight', 'bold', ...
                                 'HandleVisibility', 'On', 'Tag', 'mode2_lbl',...
                                 'Units', 'Characters', 'Position', [66.0 1.5 7 3], ...
                                 'Fontsize', 24, 'HorizontalAlignment', 'right', ...
                                 'BackgroundColor', [0.9290 0.6940 0.1250], 'ForegroundColor', 'k');
                             
handles.barval1_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab3_tabgp, ...
                                 'String', '', 'FontWeight', 'bold', ...
                                 'HandleVisibility', 'On', 'Tag', 'barval1_lbl',...
                                 'Units', 'Characters', 'Position', [75.0 5 38 3], ...
                                 'Fontsize', 24, 'HorizontalAlignment', 'right', ...
                                 'BackgroundColor', [0.9290 0.6940 0.1250], 'ForegroundColor', 'k');
                             
handles.barval2_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab3_tabgp, ...
                                 'String', '', 'FontWeight', 'bold', ...
                                 'HandleVisibility', 'On', 'Tag', 'barval2_lbl',...
                                 'Units', 'Characters', 'Position', [75.0 1.5 38 3], ...
                                 'Fontsize', 24, 'HorizontalAlignment', 'right', ...
                                 'BackgroundColor', [0.9290 0.6940 0.1250], 'ForegroundColor', 'k');

%Filtering pannel properties

global AdImLow; global AdImHigh; global AdImGamma;
global MedfiltM; global MedfiltN;
global ImbinLevel;
global MSERmin; global MSERmax; global MSERTD;

AdImLow = 130; AdImHigh = 250; AdImGamma = 1;
MedfiltM = 40; MedfiltN = 5;
ImbinLevel = 40;
MSERmin = 4000; MSERmax = 100000; MSERTD = 4;


handles.filt_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab3_tabgp, ...
                                 'String', 'Filter parameters', 'FontWeight', 'bold', ...
                                 'HandleVisibility', 'On', 'Tag', 'filt_lbl',...
                                 'Units', 'Characters', 'Position', [116.0 22.5 43 1.4], ...
                                 'Fontsize', 10, 'HorizontalAlignment', 'center', ...
                                 'BackgroundColor', [0.9 0.9 0.9], 'ForegroundColor', 'k');
                             
handles.ad_im_int_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab3_tabgp, ...
                                 'String', 'Adjust image intensity',  ...
                                 'HandleVisibility', 'On', 'Tag', 'ad_im_int_lbl',...
                                 'Units', 'Characters', 'Position', [116.0 20.7 43 1.4], ...
                                 'Fontsize', 10, 'HorizontalAlignment', 'center', ...
                                 'BackgroundColor', [0.9 0.9 0.9], 'ForegroundColor', 'b');
                             
handles.ad_im_int_form_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab3_tabgp, ...
                                 'String', 'I = imadjust(I,  [L H]/255,  [ ],  G)',  ...
                                 'HandleVisibility', 'On', 'Tag', 'ad_im_int_form_lbl',...
                                 'Units', 'Characters', 'Position', [116.0 18.9 43 1.4], ...
                                 'Fontsize', 10, 'HorizontalAlignment', 'center', ...
                                 'BackgroundColor', [0.9 0.9 0.9], 'ForegroundColor', 'k');
                             
handles.ad_im_int_LOW_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab3_tabgp, ...
                                 'String', 'Low:',  ...
                                 'HandleVisibility', 'On', 'Tag', 'ad_im_int_LOW_lbl',...
                                 'Units', 'Characters', 'Position', [116.0 17 6 1.4], ...
                                 'Fontsize', 10, 'HorizontalAlignment', 'left', ...
                                 'BackgroundColor', [0.94 0.94 0.94], 'ForegroundColor', 'k');
                             
handles.ad_im_int_HIGH_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab3_tabgp, ...
                                 'String', 'High:',  ...
                                 'HandleVisibility', 'On', 'Tag', 'ad_im_int_HIGH_lbl',...
                                 'Units', 'Characters', 'Position', [132 17 7 1.4], ...
                                 'Fontsize', 10, 'HorizontalAlignment', 'left', ...
                                 'BackgroundColor', [0.94 0.94 0.94], 'ForegroundColor', 'k');
                             
handles.ad_im_int_GAMMA_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab3_tabgp, ...
                                 'String', 'G:',  ...
                                 'HandleVisibility', 'On', 'Tag', 'ad_im_int_GAMMA_lbl',...
                                 'Units', 'Characters', 'Position', [148.0 17 4 1.4], ...
                                 'Fontsize', 10, 'HorizontalAlignment', 'left', ...
                                 'BackgroundColor', [0.94 0.94 0.94], 'ForegroundColor', 'k');
                             
handles.ad_im_int_LOW_edit = uicontrol(gcf, 'Style', 'edit', 'Parent', tab3_tabgp, ...
                                 'String', AdImLow,  ...
                                 'HandleVisibility', 'On', 'Tag', 'ad_im_int_LOW_edit',...
                                 'Units', 'Characters', 'Position', [123.0 17 6 1.4], ...
                                 'Fontsize', 10, 'HorizontalAlignment', 'right', ...
                                 'BackgroundColor', 'w', 'ForegroundColor', 'r');
                             
handles.ad_im_int_HIGH_edit = uicontrol(gcf, 'Style', 'edit', 'Parent', tab3_tabgp, ...
                                 'String', AdImHigh,  ...
                                 'HandleVisibility', 'On', 'Tag', 'ad_im_int_HIGH_edit',...
                                 'Units', 'Characters', 'Position', [139.5 17 6 1.4], ...
                                 'Fontsize', 10, 'HorizontalAlignment', 'right', ...
                                 'BackgroundColor', 'w', 'ForegroundColor', 'r');
                             
handles.ad_im_int_GAMMA_edit = uicontrol(gcf, 'Style', 'edit', 'Parent', tab3_tabgp, ...
                                 'String', AdImGamma,  ...
                                 'HandleVisibility', 'On', 'Tag', 'ad_im_int_GAMMA_edit',...
                                 'Units', 'Characters', 'Position', [153.0 17 6 1.4], ...
                                 'Fontsize', 10, 'HorizontalAlignment', 'right', ...
                                 'BackgroundColor', 'w', 'ForegroundColor', 'r');
                             
handles.medfilt_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab3_tabgp, ...
                                 'String', '2-D median filtering',  ...
                                 'HandleVisibility', 'On', 'Tag', 'medfilt_lbl',...
                                 'Units', 'Characters', 'Position', [116.0 15 43 1.4], ...
                                 'Fontsize', 10, 'HorizontalAlignment', 'center', ...
                                 'BackgroundColor', [0.9 0.9 0.9], 'ForegroundColor', 'b');
                             
handles.medfilt_form_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab3_tabgp, ...
                                 'String', 'I = medfilt2(I,  [M, N] )',  ...
                                 'HandleVisibility', 'On', 'Tag', 'medfilt_form_lbl',...
                                 'Units', 'Characters', 'Position', [116.0 13.2 43 1.4], ...
                                 'Fontsize', 10, 'HorizontalAlignment', 'center', ...
                                 'BackgroundColor', [0.9 0.9 0.9], 'ForegroundColor', 'k');
                             
handles.medfilt_M_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab3_tabgp, ...
                                 'String', 'M:',  ...
                                 'HandleVisibility', 'On', 'Tag', 'medfilt_M_lbl',...
                                 'Units', 'Characters', 'Position', [123.0 11.5 5 1.4], ...
                                 'Fontsize', 10, 'HorizontalAlignment', 'center', ...
                                 'BackgroundColor', [0.94 0.94 0.94], 'ForegroundColor', 'k');
                             
handles.medfilt_N_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab3_tabgp, ...
                                 'String', 'N:',  ...
                                 'HandleVisibility', 'On', 'Tag', 'medfilt_N_lbl',...
                                 'Units', 'Characters', 'Position', [140.0 11.5 5 1.4], ...
                                 'Fontsize', 10, 'HorizontalAlignment', 'center', ...
                                 'BackgroundColor', [0.94 0.94 0.94], 'ForegroundColor', 'k');
                             
handles.medfilt_M_edit = uicontrol(gcf, 'Style', 'edit', 'Parent', tab3_tabgp, ...
                                 'String', MedfiltM,  ...
                                 'HandleVisibility', 'On', 'Tag', 'medfilt_M_edit',...
                                 'Units', 'Characters', 'Position', [129.0 11.5 6 1.4], ...
                                 'Fontsize', 10, 'HorizontalAlignment', 'right', ...
                                 'BackgroundColor', 'w', 'ForegroundColor', 'r');
                             
handles.medfilt_N_edit = uicontrol(gcf, 'Style', 'edit', 'Parent', tab3_tabgp, ...
                                 'String', MedfiltN,  ...
                                 'HandleVisibility', 'On', 'Tag', 'medfilt_N_edit',...
                                 'Units', 'Characters', 'Position', [146.0 11.5 6 1.4], ...
                                 'Fontsize', 10, 'HorizontalAlignment', 'right', ...
                                 'BackgroundColor', 'w', 'ForegroundColor', 'r');
                             
handles.BW_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab3_tabgp, ...
                                 'String', 'Image binarization',  ...
                                 'HandleVisibility', 'On', 'Tag', 'BW_lbl',...
                                 'Units', 'Characters', 'Position', [116.0 9.7 43 1.4], ...
                                 'Fontsize', 10, 'HorizontalAlignment', 'center', ...
                                 'BackgroundColor', [0.9 0.9 0.9], 'ForegroundColor', 'b');
                             
handles.BW_form_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab3_tabgp, ...
                                 'String', 'I = im2bw(I, L/255)',  ...
                                 'HandleVisibility', 'On', 'Tag', 'BW_form_lbl',...
                                 'Units', 'Characters', 'Position', [116.0 7.9 43 1.4], ...
                                 'Fontsize', 10, 'HorizontalAlignment', 'center', ...
                                 'BackgroundColor', [0.9 0.9 0.9], 'ForegroundColor', 'k');
                             
handles.BW_Level_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab3_tabgp, ...
                                 'String', 'Level:',  ...
                                 'HandleVisibility', 'On', 'Tag', 'BW_Level_lbl',...
                                 'Units', 'Characters', 'Position', [130.0 6.2 8 1.4], ...
                                 'Fontsize', 10, 'HorizontalAlignment', 'Left', ...
                                 'BackgroundColor', [0.94 0.94 0.94], 'ForegroundColor', 'k');
                             
handles.BW_Level_edit = uicontrol(gcf, 'Style', 'edit', 'Parent', tab3_tabgp, ...
                                 'String', ImbinLevel,  ...
                                 'HandleVisibility', 'On', 'Tag', 'BW_Level_edit',...
                                 'Units', 'Characters', 'Position', [139.0 6.2 6 1.4], ...
                                 'Fontsize', 10, 'HorizontalAlignment', 'right', ...
                                 'BackgroundColor', 'w', 'ForegroundColor', 'r');
                             
handles.MSER_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab3_tabgp, ...
                                 'String', 'Detect MSER features',  ...
                                 'HandleVisibility', 'On', 'Tag', 'MSER_lbl',...
                                 'Units', 'Characters', 'Position', [116.0 4.6 26 1.4], ...
                                 'Fontsize', 9, 'HorizontalAlignment', 'center', ...
                                 'BackgroundColor', [0.9 0.9 0.9], 'ForegroundColor', 'b');
                             
handles.MSER_min_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab3_tabgp, ...
                                 'String', 'Min:',  ...
                                 'HandleVisibility', 'On', 'Tag', 'MSER_min_lbl',...
                                 'Units', 'Characters', 'Position', [116.0 3 6 1.4], ...
                                 'Fontsize', 10, 'HorizontalAlignment', 'left', ...
                                 'BackgroundColor', [0.94 0.94 0.94], 'ForegroundColor', 'k');
                             
handles.MSER_max_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab3_tabgp, ...
                                 'String', 'Max:',  ...
                                 'HandleVisibility', 'On', 'Tag', 'MSER_max_lbl',...
                                 'Units', 'Characters', 'Position', [116.0 1.55 7 1.4], ...
                                 'Fontsize', 10, 'HorizontalAlignment', 'left', ...
                                 'BackgroundColor', [0.94 0.94 0.94], 'ForegroundColor', 'k');
                             
handles.MSER_TD_lbl = uicontrol(gcf, 'Style', 'text', 'Parent', tab3_tabgp, ...
                                 'String', 'TD:',  ...
                                 'HandleVisibility', 'On', 'Tag', 'MSER_TD_lbl',...
                                 'Units', 'Characters', 'Position', [116.0 0.1 5 1.4], ...
                                 'Fontsize', 10, 'HorizontalAlignment', 'left', ...
                                 'BackgroundColor', [0.94 0.94 0.94], 'ForegroundColor', 'k');
                             
handles.MSER_min_edit = uicontrol(gcf, 'Style', 'edit', 'Parent', tab3_tabgp, ...
                                 'String', MSERmin,  ...
                                 'HandleVisibility', 'On', 'Tag', 'MSER_min_edit',...
                                 'Units', 'Characters', 'Position', [123.0 3 12 1.4], ...
                                 'Fontsize', 9, 'HorizontalAlignment', 'right', ...
                                 'BackgroundColor', 'w', 'ForegroundColor', 'r');
                             
handles.MSER_max_edit = uicontrol(gcf, 'Style', 'edit', 'Parent', tab3_tabgp, ...
                                 'String', MSERmax,  ...
                                 'HandleVisibility', 'On', 'Tag', 'MSER_max_edit',...
                                 'Units', 'Characters', 'Position', [123.0 1.55 12 1.4], ...
                                 'Fontsize', 9, 'HorizontalAlignment', 'right', ...
                                 'BackgroundColor', 'w', 'ForegroundColor', 'r');
                             
handles.MSER_TD_edit = uicontrol(gcf, 'Style', 'edit', 'Parent', tab3_tabgp, ...
                                 'String', MSERTD,  ...
                                 'HandleVisibility', 'On', 'Tag', 'MSER_TD_edit',...
                                 'Units', 'Characters', 'Position', [123.0 0.1 12 1.4], ...
                                 'Fontsize', 9, 'HorizontalAlignment', 'right', ...
                                 'BackgroundColor', 'w', 'ForegroundColor', 'r');
                             
ax_orig_img = axes('Parent', tab3_tabgp, 'HandleVisibility', 'On', ...
                    'XTickLabel', '', 'YTickLabel','', ...
                    'Units', 'Characters', 'Position', [1.0 13.0 ww 10], ...
                    'Visible', 'Off');
                
ax_proc_img = axes('Parent', tab3_tabgp, 'HandleVisibility', 'On', ...
                    'XTickLabel', '', 'YTickLabel','', ...
                    'Units', 'Characters', 'Position', [1.0 1.0 ww 10], ...
                    'Visible', 'Off');
                
ax_bw_img = axes('Parent', tab3_tabgp, 'HandleVisibility', 'On', ...
                    'XTickLabel', '', 'YTickLabel','', ...
                    'Units', 'Characters', 'Position', [58.0 13.0 ww 10], ...
                    'Visible', 'Off');
                
% ax_MSER_img = axes('Parent', tab3_tabgp, 'HandleVisibility', 'On', ...
%                     'XTickLabel', '', 'YTickLabel','', ...
%                     'Units', 'Characters', 'Position', [58.0 1.0 ww 10], ...
%                     'Visible', 'Off'); 

handles.check_MSER = uicontrol(gcf, 'Style','checkbox', 'Parent', tab3_tabgp, ...
                    'String', 'Show MSER', 'Value', 0, 'HandleVisibility', 'On', ...
                    'Units', 'Characters', 'Position', [143 4.6 16.0 1.5], ...
                    'Fontsize', 8, 'Tag', 'check_MSER','BackgroundColor', [0.9 0.9 0.9], ...
                    'Callback', @(hObject,eventdata)TemperaturePlot('check_MSER_Callback',hObject,eventdata,guidata(hObject)));

handles.btn_recpar = uicontrol(gcf, 'Style','pushbutton', 'Parent', tab3_tabgp, ...
                        'String', 'Set parameters', 'HandleVisibility', 'On', ...
                        'Units', 'Characters', 'Position', [139 2.4 20.0 1.9], ...
                        'Fontsize', 10, 'Tag', 'btn_recpar', ...
                        'Callback', @(hObject,eventdata)TemperaturePlot('btn_recpar_Callback',hObject,eventdata,guidata(hObject)));


handles.btn_rec = uicontrol(gcf, 'Style','pushbutton', 'Parent', tab3_tabgp, ...
                        'String', 'Recognize', 'HandleVisibility', 'On', ...
                        'Units', 'Characters', 'Position', [139 0.1 20.0 2], ...
                        'Fontsize', 11, 'Tag', 'btn_rec', ...
                        'Callback', @(hObject,eventdata)TemperaturePlot('btn_rec_Callback',hObject,eventdata,guidata(hObject)));

                    
% ShotCounter pannel properities
%-------------------------------
handles.btn_check_dir = uicontrol(gcf, 'Style','pushbutton', 'Parent', tab4_tabgp, ...
                        'String', 'Choose', 'HandleVisibility', 'On', ...
                        'Units', 'Characters', 'Position', [57 19.2 22.0 1.7], ...
                        'Fontsize', 11, 'Tag', 'btn_check_dir', 'HorizontalAlignment', 'left', ...
                        'Callback', @(hObject,eventdata)TemperaturePlot('btn_check_dir_Callback',hObject,eventdata,guidata(hObject)));
                    
handles.btn_resource = uicontrol(gcf, 'Style','pushbutton', 'Parent', tab4_tabgp, ...
                        'String', 'Resource', 'HandleVisibility', 'On', ...
                        'Units', 'Characters', 'Position', [125 19.2 25.0 1.7], ...
                        'Fontsize', 11, 'Tag', 'btn_resource', 'HorizontalAlignment', 'left', ...
                        'Callback', @(hObject,eventdata)TemperaturePlot('btn_resource_Callback',hObject,eventdata,guidata(hObject)));
                    
handles.btn_plot = uicontrol(gcf, 'Style','pushbutton', 'Parent', tab4_tabgp, ...
                        'String', 'Show graph', 'HandleVisibility', 'On', ...
                        'Units', 'Characters', 'Position', [125 15.9 25.0 1.7], ...
                        'Fontsize', 11, 'Tag', 'btn_plot', 'HorizontalAlignment', 'left', ...
                        'Callback', @(hObject,eventdata)TemperaturePlot('btn_plot_Callback',hObject,eventdata,guidata(hObject)));
                    

handles.lbl_shotcntTitle = uicontrol(gcf, 'Style', 'text', 'Parent', tab4_tabgp, ...
                         'String', 'Shot Counter', 'FontWeight', 'bold', ...
                         'HandleVisibility', 'On', 'Tag', 'lbl_shotcntTitle',...
                         'Units', 'Characters', 'Position', [2 22.0 157.0 1.8], ...
                         'Fontsize', 12, 'HorizontalAlignment', 'center', ...
                         'BackgroundColor', [0.9 0.9 0.9], 'ForegroundColor', 'k');
                    
handles.lbl_dir = uicontrol(gcf, 'Style', 'text', 'Parent', tab4_tabgp, ...
                         'String', 'Choose directory with LabMax logs:', ...
                         'HandleVisibility', 'On', 'Tag', 'lbl_dir',...
                         'Units', 'Characters', 'Position', [5 19.2 48.0 1.6], ...
                         'Fontsize', 11, 'HorizontalAlignment', 'left', ...
                         'BackgroundColor', [0.94 0.94 0.94], 'ForegroundColor', 'k');
                     
handles.lbl_dir_path = uicontrol(gcf, 'Style', 'text', 'Parent', tab4_tabgp, ...
                         'String', 'Здесь будет указано расположение файлов LabMax', ...
                         'HandleVisibility', 'On', 'Tag', 'lbl_dir_path',...
                         'Units', 'Characters', 'Position', [5 15.9 116.0 1.6], ...
                         'Fontsize', 9, 'HorizontalAlignment', 'left', ...
                         'BackgroundColor', [0.9 0.9 0.9], 'ForegroundColor', 'b');

handles.lbl_keyword = uicontrol(gcf, 'Style', 'text', 'Parent', tab4_tabgp, ...
                         'String', 'Search by keyword:', ...
                         'HandleVisibility', 'On', 'Tag', 'lbl_keyword',...
                         'Units', 'Characters', 'Position', [5 12.0 25.0 1.6], ...
                         'Fontsize', 10, 'HorizontalAlignment', 'left', ...
                         'BackgroundColor', [0.94 0.94 0.94], 'ForegroundColor', 'k');

handles.search_txt = uicontrol(gcf, 'Style', 'edit', 'Parent', tab4_tabgp, ...
                         'String', 'Вакуум', 'Enable', 'Off',  ...
                         'HandleVisibility', 'On', 'Tag', 'search_txt',...
                         'Units', 'Characters', 'Position', [35 12.0 25 1.6], ...
                         'Fontsize', 10, 'HorizontalAlignment', 'center', ...
                         'BackgroundColor', 'w', 'ForegroundColor', 'r');
                     
handles.lbl_filecount = uicontrol(gcf, 'Style', 'text', 'Parent', tab4_tabgp, ...
                         'String', 'Number of LabMax logs:', ...
                         'HandleVisibility', 'On', 'Tag', 'lbl_filecount',...
                         'Units', 'Characters', 'Position', [108 12.0 30.0 1.6], ...
                         'Fontsize', 10, 'HorizontalAlignment', 'left', ...
                         'BackgroundColor', [0.94 0.94 0.94], 'ForegroundColor', 'k');
                     
handles.lbl_index  = uicontrol(gcf, 'Style', 'text', 'Parent', tab4_tabgp, ...
                         'String', '', ...
                         'HandleVisibility', 'On', 'Tag', 'lbl_index',...
                         'Units', 'Characters', 'Position', [140 12.0 10.0 1.6], ...
                         'Fontsize', 10, 'HorizontalAlignment', 'right', ...
                         'BackgroundColor', [0.9 0.9 0.9], 'ForegroundColor', 'k');
                     
handles.lbl_resourceTitle = uicontrol(gcf, 'Style', 'text', 'Parent', tab4_tabgp, ...
                         'String', 'Resource', ...
                         'HandleVisibility', 'On', 'Tag', 'lbl_resourceTitle',...
                         'Units', 'Characters', 'Position', [5 9.0 150.0 1.8], ...
                         'Fontsize', 12, 'HorizontalAlignment', 'center', ...
                         'BackgroundColor', [0.9 0.9 0.9], 'ForegroundColor', 'k');

handles.lbl_resourceStit = uicontrol(gcf, 'Style', 'text', 'Parent', tab4_tabgp, ...
                         'String', 'By logs', ...
                         'HandleVisibility', 'On', 'Tag', 'lbl_resourceStit',...
                         'Units', 'Characters', 'Position', [55 4.7 20.0 1.8], ...
                         'Fontsize', 11, 'HorizontalAlignment', 'center', ...
                         'BackgroundColor', [0.94 0.94 0.94], 'ForegroundColor', 'k');
                     
handles.lbl_XL_resurstit = uicontrol(gcf, 'Style', 'text', 'Parent', tab4_tabgp, ...
                         'String', 'By EXCEL', ...
                         'HandleVisibility', 'On', 'Tag', 'lbl_XL_resurstit',...
                         'Units', 'Characters', 'Position', [85 4.7 20.0 1.8], ...
                         'Fontsize', 11, 'HorizontalAlignment', 'center', ...
                         'BackgroundColor', [0.94 0.94 0.94], 'ForegroundColor', 'k');
                     
handles.lbl_razntit = uicontrol(gcf, 'Style', 'text', 'Parent', tab4_tabgp, ...
                         'String', 'Delta', ...
                         'HandleVisibility', 'On', 'Tag', 'lbl_razntit',...
                         'Units', 'Characters', 'Position', [115 4.7 20.0 1.8], ...
                         'Fontsize', 11, 'HorizontalAlignment', 'center', ...
                         'BackgroundColor', [0.94 0.94 0.94], 'ForegroundColor', 'k');

                     
handles.lbl_resTitle = uicontrol(gcf, 'Style', 'text', 'Parent', tab4_tabgp, ...
                         'String', 'Resource:', ...
                         'HandleVisibility', 'On', 'Tag', 'lbl_resTitle',...
                         'Units', 'Characters', 'Position', [25 2.0 20.0 1.8], ...
                         'Fontsize', 11, 'HorizontalAlignment', 'left', ...
                         'BackgroundColor', [0.94 0.94 0.94], 'ForegroundColor', 'k');
                     
handles.lbl_resourceS = uicontrol(gcf, 'Style', 'text', 'Parent', tab4_tabgp, ...
                         'String', '', ...
                         'HandleVisibility', 'On', 'Tag', 'lbl_resourceS',...
                         'Units', 'Characters', 'Position', [55 2.0 20.0 1.8], ...
                         'Fontsize', 11, 'HorizontalAlignment', 'center', ...
                         'BackgroundColor', [0.94 0.94 0.94], 'ForegroundColor', 'b');
                     
handles.lbl_XL_resurs = uicontrol(gcf, 'Style', 'text', 'Parent', tab4_tabgp, ...
                         'String', '', ...
                         'HandleVisibility', 'On', 'Tag', 'lbl_XL_resurs',...
                         'Units', 'Characters', 'Position', [85 2.0 20.0 1.8], ...
                         'Fontsize', 11, 'HorizontalAlignment', 'center', ...
                         'BackgroundColor', [0.94 0.94 0.94], 'ForegroundColor', 'b');
                     
handles.lbl_razn = uicontrol(gcf, 'Style', 'text', 'Parent', tab4_tabgp, ...
                         'String', '', ...
                         'HandleVisibility', 'On', 'Tag', 'lbl_razn',...
                         'Units', 'Characters', 'Position', [115 2.0 20.0 1.8], ...
                         'Fontsize', 11, 'HorizontalAlignment', 'center', ...
                         'BackgroundColor', [0.94 0.94 0.94], 'ForegroundColor', 'b');

handles.check_search = uicontrol(gcf, 'Style','checkbox', 'Parent', tab4_tabgp, ...
                        'String', '', 'Value', 1, 'HandleVisibility', 'On', ...
                        'Units', 'Characters', 'Position', [63 12.0 4.0 1.6], ...
                        'Fontsize', 8, 'Tag', 'check_search','BackgroundColor', [0.94 0.94 0.94]);
 
                    
% ---------- EXCEL Pannel creating -----------
%---------------------------------------------
columnname = {'Date', 'Time', 'BAR', 'Count', 'Resource', 'E_start', 'E_stop', ...
            'T1', 'T2', 'T3', 'KT2', 'KT3', 'KT4', 'KT5', 'KT6'};
columnwidth = {50 42 75 55 65 55 55 55 55 55 55 55 55 55 55};
columneditable = [true true true true true true true true true true true true true true true];
rowname = {};
data = cell(5, 15);

handles.excel_edit_table = uitable(gcf, 'Parent', tab5_tabgp, 'HandleVisibility', 'On', ...
                        'Tag', 'excel_edit_table', 'Units', 'Characters', 'Position', [1.0 0.3 158.0 24.0], ...
                        'FontSize', 8, 'Data', data, ...
                        'ColumnName', columnname, 'ColumnWidth', columnwidth, 'ColumnEditable', columneditable, ...
                        'RowName', rowname);


%---------------------------------------------

                     
guidata(hObject, handles);
handles = guidata(hObject);
              


%------------------------------------------------------------------------



%-------------- Active text labels initiation ---------------------------
function edit__txt_operator_1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global Strit;
Strit = strcat('', 32);
set(hObject,'String',Strit);

function edit__txt_operator_2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global Strit;
set(hObject,'String',Strit);
%-----------------------------------------------------------------------

%------------- Active text labels callback event process ---------------
function edit__txt_operator_1_Callback(hObject, eventdata, handles)
function edit__txt_operator_2_Callback(hObject, eventdata, handles)
%-----------------------------------------------------------------------

%-- Инициализация выпадающего меню выбора количество точек построения ---
%-- графика LabMAx ------------------------------------------------------
function menu_number_shot_point_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'Value',3);
%-------------------------------------------------------------------------

%-- Инициализация выпадающего меню количества отображения последних n ----
%-- строк для графика ресураса--------------------------------------------
function menu_number_strings_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'Value',3);
%-------------------------------------------------------------------------

%----- Инициализация выпадающего меню выбора интервала для скришота -----
function menu_screen_time_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'Value',5);     %Устанавливаем в меню п.5
global screen_frame;        
screen_frame = 240;         %Задаем интервал выборки по умолчанию
%------------------------------------------------------------------------

function graph_slider_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

%---------------- LabMax graph context menu initiation ------------------
function context_lineColor_Callback(hObject, eventdata, handles)
function linecolor_r_Callback(hObject, eventdata, handles)
global nrg_line;        % For all colors in this BLOCK
global mean_nrg_line;   % parameters sets equally 
global ax_color;        % (only color difference)
global grid_color;      % -----------------------------
nrg_line = 'r';         % Graph line color
mean_nrg_line = 'y';    % Mean energy line color
ax_color = 'k';         % Graph background color
grid_color = 'w';       % Grid color
function linecolor_g_Callback(hObject, eventdata, handles)
global nrg_line;
global mean_nrg_line;
global ax_color;
global grid_color;
nrg_line = 'g';
mean_nrg_line = 'y';
ax_color = 'k';
grid_color = 'w';
function linecolor_b_Callback(hObject, eventdata, handles)
global nrg_line;
global mean_nrg_line;
global ax_color;
global grid_color;
nrg_line = 'b';
mean_nrg_line = 'y';
ax_color = 'k';
grid_color = 'w';
function linecolor_c_Callback(hObject, eventdata, handles)
global nrg_line;
global mean_nrg_line;
global ax_color;
global grid_color;
nrg_line = 'c';
mean_nrg_line = 'y';
ax_color = 'k';
grid_color = 'w';
function linecolor_m_Callback(hObject, eventdata, handles)
global nrg_line;
global mean_nrg_line;
global ax_color;
global grid_color;
nrg_line = 'm';
mean_nrg_line = 'y';
ax_color = 'k';
grid_color = 'w';
function linecolor_y_Callback(hObject, eventdata, handles)
global nrg_line;
global mean_nrg_line;
global ax_color;
global grid_color;
nrg_line = 'y';
mean_nrg_line = 'g';
ax_color = 'k';
grid_color = 'w';
function linecolor_k_Callback(hObject, eventdata, handles)
global nrg_line;
global mean_nrg_line;
global ax_color;
global grid_color;
nrg_line = 'k';
mean_nrg_line = 'y';
ax_color = 'w';
grid_color = 'b';
%------------------------------------------------------------------------

% ------- Temperature scale select button callback event process --------
function btn_10_Callback(hObject, eventdata, handles)
check_tmp(hObject, eventdata, handles)  
function btn_50_Callback(hObject, eventdata, handles)
check_tmp(hObject, eventdata, handles)
function btn_100_Callback(hObject, eventdata, handles)
check_tmp(hObject, eventdata, handles)
function btn_200_Callback(hObject, eventdata, handles)
check_tmp(hObject, eventdata, handles)
function btn_500_Callback(hObject, eventdata, handles)
check_tmp(hObject, eventdata, handles)
function btn_1000_Callback(hObject, eventdata, handles)
check_tmp(hObject, eventdata, handles)
function btn_all_Callback(hObject, eventdata, handles)
check_tmp(hObject, eventdata, handles)
%----------------------------------------------------------------------

%------------------- Text labels initiation ---------------------------
function lbl_current_energy_CreateFcn(hObject, eventdata, handles)
set(hObject, 'String', '');     % Current energu label (clear)
function lbl_min_energy_CreateFcn(hObject, eventdata, handles)
set(hObject, 'String', '');     % Min energy label (clear)
function lbl_max_energy_CreateFcn(hObject, eventdata, ~)
set(hObject, 'String', '');     % Max energy label (clear)
function lbl_mean_energy_CreateFcn(hObject, eventdata, handles)
set(hObject, 'String', '');     % Mean energy label (clear)
function lbl_count_energy_CreateFcn(hObject, eventdata, handles)
set(hObject, 'String', '');     % Count label (clear)
function lbl_resource_CreateFcn(hObject, eventdata, handles)
set(hObject, 'String', '');     % Resourse label (clear)
function lbl_labmax_path_CreateFcn(hObject, eventdata, handles)
set(hObject, 'String', 'Выберите файл с данными энергии');      % LabMax path label (set some text)
function path_lbl_CreateFcn(hObject, eventdata, handles)
set(hObject, 'String', 'Выберите файл с данными температуры');  % OwenTemp path label (set some text)
%----------------------------------------------------------------------

% ------------- Date & time text labels initiation --------------------
function lbl_date_CreateFcn(hObject, eventdata, handles)
set(hObject, 'String', datestr(now, 1));    % Set data to label
function lbl_time_CreateFcn(hObject, eventdata, handles)
set(hObject, 'String', datestr(now, 15));   % Set time to label
%---------------------------------------------------------------------

%------------ Actual temperature text labels initiation --------------
function tmp_ch1_CreateFcn(hObject, eventdata, handles)
set(hObject, 'String', '');     % Temperature channel 1 (clear)
function tmp_ch2_CreateFcn(hObject, eventdata, handles)
set(hObject, 'String', '');     % Temperature channel 2 (clear)
function tmp_ch3_CreateFcn(hObject, eventdata, handles)
set(hObject, 'String', '');     % Temperature channel 3 (clear)
function tmp_ch4_CreateFcn(hObject, eventdata, handles)
set(hObject, 'String', '');     % Temperature channel 4 (clear)
function tmp_ch5_CreateFcn(hObject, eventdata, handles)
set(hObject, 'String', '');     % Temperature channel 5 (clear)
%----------------------------------------------------------------------

% --------------- ON AIR/VACUUM tex label initiation ------------------
function lbl_bar_CreateFcn(hObject, eventdata, handles)
set(hObject, 'BackgroundColor', 'w');   % Clear
%-----------------------------------------------------------------------

%----------------- Text label ACTUAL initiation ------------------------
function lbl_temp_CreateFcn(hObject, eventdata, handles)
%set(hObject, 'String', 'Actual');
%-----------------------------------------------------------------------

%------------- Text label for EXCEL file path initiation ---------------
function lbl_excel_path_CreateFcn(hObject, eventdata, handles)
set(hObject, 'String', '');
%-----------------------------------------------------------------------

%------------------ Panel for EXCEL table initiation -------------------
function excel_panel_CreateFcn(hObject, eventdata, handles)
set(hObject, 'Visible', 'Off');     % Set panel unseeable (default)
%-----------------------------------------------------------------------

%----------------------- EXCEL table initiation ------------------------
function excel_table_CreateFcn(hObject, eventdata, handles)
%-----------------------------------------------------------------------

%------------ Temperature sensors location panel initiation  -----------
function pic_panel_CreateFcn(hObject, eventdata, handles)
set(hObject, 'Visible', 'Off')      % Set panel unseeable (default)
%-----------------------------------------------------------------------

% ------------- Temperature sensors location axis initiation -----------
function ax_scheme_CreateFcn(hObject, eventdata, handles)
global ax_sch;
ax_sch=findobj('Type','axes','Tag','ax_scheme');   % Set axis
set(ax_sch,'XTickLabel','');                       % Clear X label 
set(ax_sch,'YTickLabel','');                       % Clear Y label                
sh = imread('d:\! RESURS_2018\shemka.jpeg');       % Set image with temperature sensors location
image(ax_sch, sh);                                 % Show image on axis
set(ax_sch, 'Visible', 'off');                     % Set panel unseeable (default) 
%-----------------------------------------------------------------------

%------------------------ AXES INITIATION ------------------------------
%-----------------------------------------------------------------------
%------------ Temperature axes (all axes initiation as 1st) ------------
function temp_ch1_CreateFcn(hObject, eventdata, handles)
global ax1;
ax1=findobj('Type','axes','Tag','temp_ch1');    % Set 1st channel axes
set(ax1,'XTickLabel','');                       % Clear X label 
set(ax1,'YTickLabel','');                       % Clear Y label 
function temp_ch2_CreateFcn(hObject, eventdata, handles)
global ax2;
ax2=findobj('Type','axes','Tag','temp_ch2');
set(ax2,'XTickLabel','');
set(ax2,'YTickLabel','');
function temp_ch3_CreateFcn(hObject, eventdata, handles)
global ax3;
ax3=findobj('Type','axes','Tag','temp_ch3');
set(ax3,'XTickLabel','');
set(ax3,'YTickLabel','');
function temp_ch4_CreateFcn(hObject, eventdata, handles)
global ax4;
ax4=findobj('Type','axes','Tag','temp_ch4');
set(ax4,'XTickLabel','');
set(ax4,'YTickLabel','');
function temp_ch5_CreateFcn(hObject, eventdata, handles)
global ax5;
ax5=findobj('Type','axes','Tag','temp_ch5');
set(ax5,'XTickLabel','');
set(ax5,'YTickLabel','');
%----------------------- LabMax graph axis -----------------------------
function energy_plot_CreateFcn(hObject, eventdata, handles)
global ax_energy;       
global nrg_line;
global ax_color;
global mean_nrg_line;
global grid_color;
nrg_line = 'g';         % Line color (default)
mean_nrg_line = 'y';    % Mean energy line color (default)
ax_color = 'k';         % Graph background color (default)
grid_color = 'w';       % Grid color (default)
ax_energy=findobj('Type','axes','Tag','energy_plot');   % Set axis
set(ax_energy,'XTickLabel','');     % Clear X label
set(ax_energy,'YTickLabel','');     % Clear Y label
%---------------------- Resourse graph axis ----------------------------
function resource_plot_CreateFcn(hObject, eventdata, handles)
global ax_resource;
ax_resource=findobj('Type','axes','Tag','resource_plot');
set(ax_resource,'XTickLabel','');
set(ax_resource,'YTickLabel','');
%-------------------- Short resourse graph axis -------------------------
function resourse_short_plot_CreateFcn(hObject, eventdata, handles)
global ax_short_resource;
ax_short_resource = findobj('Type','axes','Tag','resourse_short_plot');
set(ax_short_resource,'XTickLabel','');
set(ax_short_resource,'YTickLabel','');
%----------------------------------------------------------------------

%---------- Обработка кнопки выбора файлов с логами --------------------
function btn_chek_logs_Callback(hObject, eventdata, handles)

global file_LabMax;         % Лог-файл LabMax
global file_Owen;           % Файл с данными температуры
global XLPath;

new_log_search(hObject, eventdata, handles);            % Search files

set(handles.check_all, 'Enable', 'on');                 % Снимаем флажок "Чекать all"

if get(handles.Labmaxenable_check, 'Value')
    set(handles.lbl_labmax_path, 'String', file_LabMax);    % и энергией
    set(handles.Labmaxcpath_lbl, 'String', file_LabMax);
else
    set(handles.lbl_labmax_path, 'String', 'LabMax file do not used!');
    set(handles.Labmaxcpath_lbl, 'String', 'LabMax file do not used!');
end

if get(handles.EXCELenable_check, 'Value')
    XLPath = 'd:\! RESURS_2018\1ый_технологический\Таблица учета_вакуум_TO.xlsm';     %%%%%%%%%%     *1)
    handles.lbl_excel_path.String = XLPath;
    handles.EXCELcpath_lbl.String = XLPath;
else
    handles.lbl_excel_path.String = 'EXCEL file do not used!';
    handles.EXCELcpath_lbl.String = 'EXCEL file do not used!';
end

if get(handles.TempEnable_check, 'Value')
    set(handles.path_lbl, 'String', file_Owen);             % Отображаем на панели путь к файлу с температурой
    set(handles.Tempcpath_lbl, 'String', file_Owen);
    try
        C = fileopen(file_Owen);                                % Открываем файл
    catch
        handles.ErrorLog.String = 'Cfkjighdspogh';
    end
    %open_btn (hObject, eventdata, handles, length(C{1,1}));
    set(handles.lbl_text_point, 'Enable', 'On');            % Активируем надпись
    set(handles.lbl_length, 'String', length(C{1,1}));      % Выводим на панель количество строк в файле
    set(handles.btn_all, 'Value', 1);                       % Задаем количество точек построения (по умолчанию)
    set(handles.btn_keeper_log_plot, 'Enable', 'On');
else
    set(handles.path_lbl, 'String', 'Temperature file do not used!');             % 
    set(handles.Tempcpath_lbl, 'String', 'Temperature file do not used!');        %
end

set(gcf, 'InvertHardcopy', 'off');       % Задаем параметры для
set(gcf, 'PaperPositionMode', 'auto');   % сохранения картинки
%-----------------------------------------------------------------------

%-------------- Функция поиска актуальных лог-файлов--------------------
function new_log_search(hObject, eventdata, handles)
global path_l;              % Путь последнего по дате изменения файла
global last;                % Дата изменения последнего файла
global file_LabMax;         % Лог-файл LabMax
global file_Owen;           % Файл с данными температуры
global file_ResursKeeper;   % Лог-файл Resurs Keeper

path_LabMax = 'd:\! RESURS_2018\1ый_технологический\';      % Указываем 
path_Owen = 'd:\! RESURS_2018\Temperature\';                % путик к
path_ResursKeeper = 'd:\! RESURS_2018\ResursKeeperLogs\';   % логам

last = '20-апр-1998 00:00:01';          % Задаем дату для сравнения и       
last = datenum(last);                   % переводим ее в числовой формат
get_last_LabMax_file(path_LabMax);      % Ищем актуальный файл
file_LabMax = path_l;                   % LabMax

last = '20-апр-1998 00:00:01';          % --
last = datenum(last);                   % --
get_last_txt_file(path_Owen);           % --
file_Owen = path_l;                     % Owen Temperature

last = '20-апр-1998 00:00:01';          % --
last = datenum(last);                   % --
get_last_txt_file(path_ResursKeeper);   % --
file_ResursKeeper = path_l;             % Resurs Keeper
%-----------------------------------------------------------------------

%--- Функция обнаружения последнего (по дате изменения) файла LabMax ---
function get_last_LabMax_file(put)

global last;
global path_l;

mass_path = dir(put);

    for i=1:1:length(mass_path)
        
        str_name = mass_path(i).name;
        full_path = strcat(mass_path(i).folder, '\', str_name);
        
        if mass_path(i).isdir & strncmp('Вакуум', str_name, 6)
            
            get_last_LabMax_file(full_path)
            
        elseif length(findstr('csv',str_name)) > 0
            
            t = dir(full_path);
            
            if t.bytes > 100 & t.datenum > last
                last = t.datenum;
                path_l = full_path;
            end
        
        end
   
    end
%-----------------------------------------------------------------------
    
%-- Функция обнаружения последнего (по дате изменения) файла c данными --
%-- температуры ---------------------------------------------------------
function get_last_txt_file(put)

global last;
global path_l;

mass_path = dir(put);

    for i=1:1:length(mass_path)
        
        str_name = mass_path(i).name;
        full_path = strcat(mass_path(i).folder, '\', str_name);
        
        if mass_path(i).isdir
            
            get_last_LabMax_file(full_path)
            
        elseif length(findstr('txt',str_name)) > 0
            
            t = dir(full_path);
            
            if t.datenum > last
                last = t.datenum;
                path_l = full_path;
            end
        
        end
   
    end
%------------------------------------------------------------------------

%------------------------ Work with log selection -----------------------
%------------------------------------------------------------------------
function btn_TempLog_Callback(hObject, eventdata, handles)
global file_Owen;

[file, path] = uigetfile('d:\*.txt');

if ~isequal(file,0)
    file_Owen = strcat(path, file);
end

set(handles.path_lbl, 'String', file_Owen);
set(handles.Tempcpath_lbl, 'String', file_Owen);

function btn_EXCELLog_Callback(hObject, eventdata, handles)
global XLPath;

[file, path] = uigetfile('d:\*.xlsm');

if ~isequal(file,0)
    XLPath = strcat(path, file);
end

handles.lbl_excel_path.String = XLPath;
handles.EXCELcpath_lbl.String = XLPath;

function btn_LabmaxLog_Callback(hObject, eventdata, handles)
global file_LabMax;

[file, path] = uigetfile('d:\*.csv');

if ~isequal(file,0)
    file_LabMax = strcat(path, file);
end

handles.Labmaxcpath_lbl.String = file_LabMax;
handles.lbl_labmax_path.String = file_LabMax;
%------------------------------------------------------------------------


%-------------- Обработка событий флажка "Чекать all" ------------------    
function check_all_Callback(hObject, eventdata, handles)

global tp;
global ax1;                 % 1-я Ось температуры
global ax2;                 % 2-я Ось температуры
global ax3;                 % 3-я Ось температуры
global ax4;                 % 4-я Ось температуры
global ax5;                 % 5-я Ось температуры
global ax_energy;           % Ось графика LabMax
global ax_short_resource;   % Ось укороченного графика ресурса 
global ax_resource;         % Ось графика ресурса
global data_table;          % Массив данных из EXCEL
global screen_frame;        % Период выборки скриншота
global bar_screen_frame;    % 
global file_LabMax;         % Лог-файл LabMax
global file_Owen;           % Файл с данными температуры
global R;                   % Значение ресурса из таблицы ECXEL

i = 0;                      % Счетчик времени

try
    
    if get(handles.check_all, 'Value')                      % Флажок "Чекать all" ВКЛ
        
        set(handles.btn_chek_logs, 'Enable', 'off');        % Закрываем кнопку "Выбрать файлы"
        
        if get(handles.TempEnable_check, 'Value')
            set(handles.lbl_text_point, 'Enable', 'On');    % Активируем надпись "Количество точек в файле"
        end
        
        set(handles.btn_plot_energy, 'Enable', 'On');       % Открываем кнопку "Обновить график"
        set(handles.menu_number_strings, 'Enable', 'On');   % Открываем меню выбора количества строк для отображения
        set(handles.show_panel_check, 'Enable', 'On');      % Открываем флажок "Show table"
        set(handles.excel_panel, 'Visible', 'On');          % Включаем панель с таблицей EXCEL
        set(handles.btn_screen, 'Enable', 'On');            % Открываем кнопку "Print Screen"
        set(handles.check_nrg, 'Enable', 'On');             % Открываем флажок "Energy"
        set(handles.check_tmp, 'Enable', 'On');             % Открываем флажок "Temperature"
        set(handles.check_screen, 'Enable', 'On');          % Открываем флажок "Auto Screens"
        set(handles.menu_screen_time, 'Enable', 'On');      % Закрываем меню выбора интервала для скриншота
        
        if get(handles.EXCELenable_check, 'Value')
            excel_open(hObject, eventdata, handles);            % Считываем данные из EXCEL
            resource_plot(hObject, eventdata, handles);         % Строим график ресурса
            resource_plot(hObject, eventdata, handles);         % повторно (есть нюансы с осью Х)    
            resource_short_plot(hObject, eventdata, handles);   % Строим укороченный график ресурса
            resource_short_plot(hObject, eventdata, handles);   % повторно (есть нюансы с очью Х)
            set(handles.excel_table, 'Data', data_table);
        end
        
        if get(handles.TempEnable_check, 'Value')
            check_tmp(hObject, eventdata, handles);             % Строим графики температуры
        end
        
    else
                                                            % Флажок "Чекать all" ВЫКЛ
                                                            
        set(handles.btn_chek_logs, 'Enable', 'On');         % Открываем кнопку "Выбрать файлы"
        set(handles.show_panel_check, 'Enable', 'Off');     % Закрываем флажок "Show table"
        set(handles.show_panel_check, 'Value', 1);          % Выключаем флажок "Energy" (по умолчанию - ВЫКЛ)
        set(handles.excel_panel, 'Visible', 'On');          % Включаем панель с таблицей EXCEL
        set(handles.btn_screen, 'Enable', 'Off');           % Закрываем кнопку "Print Screen"
        set(handles.check_nrg, 'Value', 1);                 % Включаем флажок "Energy" (по умолчанию - ВКЛ)
        set(handles.check_nrg, 'Enable', 'Off');            % Закрываем флажок "Energy"
        set(handles.check_tmp, 'Value', 1);                 % Включаем флажок "Temperature" (по умолчанию - ВКЛ)
        set(handles.check_tmp, 'Enable', 'Off');            % Закрываем флажок "Temperature"
        set(handles.check_screen, 'Value', 1);              % Выключаем флажок "Auto Screens" (по умолчанию - ВКЛ)
        set(handles.check_screen, 'Enable', 'Off');         % Закрываем флажок "Auto Screens"
        set(handles.menu_screen_time, 'Value', 5);          % Задаем интервал выборки скриншота (по умолчанию)
        set(handles.menu_screen_time, 'Enable', 'Off');     % Закрываем меню выбора интервала для скриншота
        set(handles.lbl_bar, 'BackgroundColor', 'w');       % Чистим цвет поля воздух/вакуум
        set(handles.lbl_bar, 'String', '');                 % Чистим содержимое строки воздух/вакуум
        
        
        cla(ax1); cla(ax2); cla(ax3); cla(ax4); cla(ax5);   % Чистим оси графиков температуры
        cla(ax_energy);                                     % и энергии LabMax
        
        set(handles.tmp_ch1, 'String', '');                 % Чистим поля текущей температуры
        set(handles.tmp_ch2, 'String', '');                 % по всем каналам
        set(handles.tmp_ch3, 'String', '');                 % --
        set(handles.tmp_ch4, 'String', '');                 % --
        set(handles.tmp_ch5, 'String', '');                 % --
        
        set(handles.lbl_current_energy, 'String', '')       % Чистим поле со значением текущей энергии,
        set(handles.lbl_min_energy, 'String', '');          % минимальной, 
        set(handles.lbl_max_energy, 'String', '');          % максимальной,
        set(handles.lbl_mean_energy, 'String', '');         % средней;
        set(handles.lbl_count_energy, 'String', '');        % Чистим поле со значением счетчика
        set(handles.lbl_resource, 'String', '');            % Чистим поле со значением ресурса
        
        set(handles.btn_1000, 'Enable', 'Off');             % Выключаем кнопки выбора количества точек
        set(handles.btn_500, 'Enable', 'Off');              % для построения графиков температуры
        set(handles.btn_200, 'Enable', 'Off');              % --
        set(handles.btn_100, 'Enable', 'Off');              % --
        set(handles.btn_50, 'Enable', 'Off');               % --
        set(handles.btn_10, 'Enable', 'Off');               % --
        set(handles.btn_all, 'Enable', 'Off');              % --
         
         
        yyaxis(ax_short_resource, 'left');                  % -- Чистим левую ось укороченного графика ресурса
        cla(ax_short_resource);                             % -- 
        yyaxis(ax_short_resource, 'right');                 % -- Чистим правую ось укороченного графика ресурса
        cla(ax_short_resource);                             % --
        set(ax_short_resource,'XTickLabel','');             % Удаляем подписи оси Х и оси Y
        set(ax_short_resource,'YTickLabel','');             % укорочеснного графика ресурса
        
        yyaxis(ax_resource, 'left');                        % -- Чистим левую ось графика ресурса
        cla(ax_resource);                                   % -- 
        yyaxis(ax_resource, 'right');                       % -- Чистим правую ось графика ресурса
        cla(ax_resource);                                   % -- 
        set(ax_resource,'XTickLabel','');                   % Удаляем подписи оси Х и оси Y
        set(ax_resource,'YTickLabel','');                   % графика ресурса
        
        set(handles.lbl_length, 'String', '');              % Чистим поле с количеством строк в файле температуры
        set(handles.lbl_text_point, 'Enable', 'Off');       % Закрываем поле с подписью
        set(handles.btn_all, 'Value', 1);                   % Задаем количество точек для построения графика температуры (по умолчанию)
        set(handles.btn_plot_energy, 'Enable', 'Off');      % Открываем кнопку "Обновить график"
        set(handles.menu_number_strings, 'Enable', 'Off');  % Закрываем меню выбора количества строк для отображения
        return;
    end
    
    while get(handles.check_all, 'Value')                       % Пока флажок "Чекать all" ВКЛ
        
        i = i+1;                                                % Увеличиваем счетчик    
        set(handles.lbl_date, 'String', datestr(now, 1));       % Выводим текущую дату
        set(handles.lbl_time, 'String', datestr(now, 15));      % и время
        
        if (rem(i,800) == 0) && (get(handles.TempUpdate_check, 'Value'))    % Каждые n минут
            prev_log = file_Owen;                                           % Сохраняем путь предыдущего лог-файла температуры
            new_log_search(hObject, eventdata, handles);                    % Ищем новые лог-файлы

            if strcmp(prev_log, file_Owen) == 0                             % Если пути не совпадают (был создан новый лог температуры)
                set(handles.btn_all, 'Value', 1);                           % Задаем количество точек для построения графика температуры (по умолчанию)
            end
            
            set(handles.path_lbl, 'String', file_Owen);             % Выводим путь лог-файла температуры     
            set(handles.lbl_labmax_path, 'String', file_LabMax);    % и энергии LabMax
            
            i = 0;
        end
        
        if (rem(i,500) == 0) && (get(handles.helloworld_lbl, 'String') ~= ("Super user mode activated!"))
            btn_stat1_Callback(hObject, eventdata, handles);        % Plot statistic picture
            btn_stat2_Callback(hObject, eventdata, handles);
        end
        
        if get(handles.check_bar, 'Value') && rem(i,bar_screen_frame) == 0
            webcaminit(hObject, eventdata, handles);
        end
        
        if get(handles.check_nrg, 'Value') && get(handles.Labmaxenable_check, 'Value')  % Если флажок "Energy" ВКЛ
            plot_LabMax(hObject, eventdata, handles);                                   % Строим график энергии LabMax
        end
        
        if get(handles.check_tmp, 'Value') && get(handles.TempEnable_check, 'Value') && rem(i,40) == 0    % Если флажок "Temperature" ВКЛ (каждые n секунд)
            check_tmp(hObject, eventdata, handles);             % строим графики температуры
        end
        
        if (i == 300) && (get(handles.EXCELenable_check, 'Value'))  % Каждые n секунд (2400 было)  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%*2) (для ТО)
            excel_open(hObject, eventdata, handles);            % Считываем данные из EXCEL
            resource_plot(hObject, eventdata, handles);         % Строим график ресурса
            resource_plot(hObject, eventdata, handles);         % повторно (есть нюансы с осью Х)
            resource_short_plot(hObject, eventdata, handles);   % Строим укороченный график ресурса
            resource_short_plot(hObject, eventdata, handles);   % повторно (есть нюансы с осью Х)
            
            if get(handles.show_panel_check, 'Value')           % Если флажок "Show table" ВКЛ
                set(handles.excel_table, 'Data', data_table);   % выводим данные из EXCEL в таблицу    
            end
            
            save_image(hObject, eventdata, handles);            % Сохраняем окно
            
            if ~get(handles.TempUpdate_check, 'Value')
                i = 0;                                              % Обнуляем счетчик
            end
        end
        
        if get(handles.check_screen, 'Value') && rem(i,screen_frame) == 0   % Если флажок "Auto Screens" вкл (каждые n секунд)
            save_image(hObject, eventdata, handles);                        % Сохраняем окно
        end
        
        pause(0.4);                                             % Ждем 0,4 сек
        
    end
    
    while get(handles.check_all, 'Value') == 0                  % Пока флажок "Чекать all" ВЫКЛ
        set(handles.lbl_date, 'String', datestr(now, 1));       % Выводим текущую дату
        set(handles.lbl_time, 'String', datestr(now, 15));      % и время
        pause(0.5);                                             % Ждем 0,5 сек    
    end
    
catch
    
    return;     % Если в предыдущем блоке была ошибка - выходим
    
end
%-----------------------------------------------------------------------

%------------- Обработка событий флажка "Energy" ----------------------
function check_nrg_Callback(hObject, eventdata, handles)

global ax_energy;                                   % Ось графика LabMax

if get(handles.check_nrg, 'Value') == 0             % Если флажок "Energy" ВКЛ
    
    cla(ax_energy);                                 % Чистим ось графика LabMax
    set(handles.lbl_current_energy, 'String', '')   % Чистим поле со значением текущей энергии,
    set(handles.lbl_min_energy, 'String', '');      % минимальной,
    set(handles.lbl_max_energy, 'String', '');      % максимальной,
    set(handles.lbl_mean_energy, 'String', '');     % средней.
    set(handles.lbl_count_energy, 'String', '');    % Чистим поле со значением счетчика
    
end
%----------------------------------------------------------------------

%------------ Обработка событий флажка "Temperature" ------------------
function check_tmp_Callback(hObject, eventdata, handles)

global ax1;     % 1-я ось температуры
global ax2;     % 2-я ось температуры
global ax3;     % 3-я ось температуры
global ax4;     % 4-я ось температуры
global ax5;     % 5-я ось температуры

if get(handles.check_tmp, 'Value') && get(handles.TempEnable_check, 'Value')        % Если флажок "Temperature" ВКЛ
    set(handles.lbl_text_point, 'Enable', 'On');                                    % Активируем поле пояснительного текста
    check_tmp(hObject, eventdata, handles);                                         % Строим графики температуры
else
    cla(ax1); cla(ax2); cla(ax3); cla(ax4); cla(ax5);   % Чистим оси
    set(handles.tmp_ch1, 'String', '');                 % Чистим поля с актуальными знаяениями температуры
    set(handles.tmp_ch2, 'String', '');                 % (по всем каналам)
    set(handles.tmp_ch3, 'String', '');                 % --
    set(handles.tmp_ch4, 'String', '');                 % --
    set(handles.tmp_ch5, 'String', '');                 % --
    set(handles.btn_1000, 'Enable', 'Off');             % Выключаем кнопки выбоора количества точек для построения графика
    set(handles.btn_500, 'Enable', 'Off');              % --
    set(handles.btn_200, 'Enable', 'Off');              % --
    set(handles.btn_100, 'Enable', 'Off');              % --
    set(handles.btn_50, 'Enable', 'Off');               % --
    set(handles.btn_10, 'Enable', 'Off');               % --
    set(handles.btn_all, 'Enable', 'Off');              % --
    set(handles.lbl_length, 'String', '');          % Чистим поле "Число строк в файле"
    set(handles.lbl_text_point, 'Enable', 'Off');   % Деактивируем поле пояснительного текста
    set(handles.btn_all, 'Value', 1);               % Задаем количество точек для построения графика температуры (по умолчанию)
end
%----------------------------------------------------------------------

%--------- Обработка событий флажка "Auto Screens" ---------------------
function check_screen_Callback(hObject, eventdata, handles)

if get(handles.check_screen, 'Value')                   % Флажок "Auto Screens" ВКЛ               
    set(handles.menu_screen_time, 'Enable', 'On');      % Открываем меню выбора интервалов для скриншотов
else
    set(handles.menu_screen_time, 'Enable', 'Off');     % Закрываем меню выбора интервалов для скриншотов
    set(handles.menu_screen_time, 'Value', 5);          % Задаем интервал выборки скриншотов (по умолчанию)
end
%-----------------------------------------------------------------------

%-- Обработка собвытий выпадающего меню выбора интервалов для скриншотов
function menu_screen_time_Callback(hObject, eventdata, handles)

global screen_frame;                            % Интервал выборки

vall = get(handles.menu_screen_time, 'Value');  % Считываем данные из выпадающего меню
switch vall
    case 1                                      % В зависимости от выбранного значения
        screen_frame = 20;                      % формируем задержку
    case 2                                      % --
        screen_frame = 40;                      % --
    case 3                                      % --
        screen_frame = 80;                      % --
    case 4                                      % --
        screen_frame = 120;                     % --
    case 5                                      % --
        screen_frame = 240;                     % --
    case 6                                      % --
        screen_frame = 600;                     % --
    case 7                                      % --
        screen_frame = 1200;                    % --
    case 8                                      % --
        screen_frame = 2400;                    % --
end
%------------------------------------------------------------------------

%-------------- Обработка событий кнопки "Print Screen" ---------------
function btn_screen_Callback(hObject, eventdata, handles)
save_image(hObject, eventdata, handles)
%----------------------------------------------------------------------

%------------ Функция построения графиков температуры ------------------
function check_tmp(hObject, eventdata, handles)

    global tp;              % Количество точек для отображения
    global file_Owen;       % Лог-файл с данными температуры
    global ax1;             % 1-я ось
    global ax2;             % 2-я ось
    global ax3;             % 3-я ось
    global ax4;             % 4-я ось
    global ax5;             % 5-я ось
    
try
    C = fileopen(file_Owen);                                    % Читаем данные из файла
catch
    handles.ErrorLog.String = 'Error opening temperature log file';
end
open_btn(hObject, eventdata, handles, length(C{1,1}));      % "Открываем" кнопки 
set(handles.lbl_length, 'String', length(C{1,1}));          % Выводим в поле количество строк в файле

[date,time] = strtok(C{1,9});   % Разбиваем последний столбец на           
[dd,rem]=strtok(date, '-');     % дату и время
[mm,rem]=strtok(rem, '-');      % --
yy=strtok(rem, '-');            % --
    
date = datenum((strcat(mm, '/', dd, '/', yy, ' ', time)));  % Переводим в формат даты Matlab

if get(handles.btn_all, 'Value')        % В зависимости от выбранной кнопки
    tp = length(date)-1;                % задаем число точек
elseif get(handles.btn_10, 'Value')     % для отображения
    tp = 10;                            % --
elseif get(handles.btn_50, 'Value')     % --
    tp = 50;                            % --
elseif get(handles.btn_100, 'Value')    % --
    tp = 100;                           % --
elseif get(handles.btn_200, 'Value')    % --
    tp = 200;                           % --
elseif get(handles.btn_500, 'Value')    % --
    tp = 500;                           % --
elseif get(handles.btn_1000, 'Value')   % --
    tp = 1000;                          % --
end                                     % --

date = date(length(date)-tp:end);       % Выбираем последние n точек для оси Х (время)

TMP1 = C{1,2};                          % Выбираем последние n точек 
TMP1 = TMP1(length(TMP1)-tp:end);       % для 1-го канала
TMP2 = C{1,3};                          % Выбираем последние n точек 
TMP2 = TMP2(length(TMP2)-tp:end);       % для 2-го канала
TMP3 = C{1,4};                          % Выбираем последние n точек 
TMP3 = TMP3(length(TMP3)-tp:end);       % для 3-го канала
TMP4 = C{1,5};                          % Выбираем последние n точек 
TMP4 = TMP4(length(TMP4)-tp:end);       % для 4-го канала
TMP5 = C{1,6};                          % Выбираем последние n точек 
TMP5 = TMP5(length(TMP5)-tp:end);       % для 5-го канала

set(handles.tmp_ch1, 'String', sprintf('%.1f', TMP1(length(TMP1))));    % Выводим текущее значение
set(handles.tmp_ch2, 'String', sprintf('%.1f', TMP2(length(TMP2))));    % температуры по каналам
set(handles.tmp_ch3, 'String', sprintf('%.1f', TMP3(length(TMP3))));    % --    
set(handles.tmp_ch4, 'String', sprintf('%.1f', TMP4(length(TMP4))));    % --
set(handles.tmp_ch5, 'String', sprintf('%.1f', TMP5(length(TMP5))));    % --

hp1 = plot(ax1,date, TMP1, 'b', 'LineWidth', 1);            % Строим график 1-го канала
ha1 = get(hp1,'Parent');                                    % Получаем параметры обьекта
set(ha1, 'XLim', [min(date) max(date)]);                    % Пределы по оси Х
set(ha1, 'YLim', [min(TMP1)-0.05 max(TMP1)+0.05]);          % Пределы по оси Y
%Data = get(ha1,'XTick');
%timestr = datestr(Data,13);
set(ha1,'XTickLabel','');                                   % Убираем данные под осью Х
set(ha1, 'YGrid', 'On');                                    % Включаем сетку по оси Y
%title('Температура КТ-2');
ylabel (ax1,'t, \circС', 'Color', 'blue', 'FontSize', 10);  % Подпись оси Y

hp2 = plot(ax2, date, TMP2, 'c', 'LineWidth', 1);           % --
ha2 = get(hp2,'Parent');                                    % --
set(ha2, 'XLim', [min(date) max(date)]);                    % --
set(ha2, 'YLim', [min(TMP2)-0.05 max(TMP2)+0.05]);          % --
%Data2 = get(ha2,'XTick');                                  
%timestr2 = datestr(Data2,13);
set(ha2,'XTickLabel','');                                   % --
set(ha2, 'YGrid', 'On');                                    % --
%title('Температура КТ-3');
ylabel (ax2,'t, \circС', 'Color', 'blue', 'FontSize', 10);  % --

hp3 = plot(ax3, date, TMP3, 'r', 'LineWidth', 2);           % --
ha3 = get(hp3,'Parent');                                    % --
set(ha3, 'XLim', [min(date) max(date)]);                    % --
set(ha3, 'YLim', [min(TMP3)-0.05 max(TMP3)+0.05]);          % --
%Data3 = get(ha3,'XTick');
%timestr3 = datestr(Data3,13);
set(ha3,'XTickLabel','');                                   % --
set(ha3, 'YGrid', 'On');                                    % --
%title('Температура КТ-4');
ylabel (ax3,'t, \circС', 'Color', 'blue', 'FontSize', 10);  % --

hp4 = plot(ax4, date, TMP4, 'm', 'LineWidth', 1);           % --
ha4 = get(hp4,'Parent');                                    % --
set(ha4, 'XLim', [min(date) max(date)]);                    % --
set(ha4, 'YLim', [min(TMP4)-0.05 max(TMP4)+0.05]);          % --
%Data4 = get(ha4,'XTick');
%timestr4 = datestr(Data4,13);
set(ha4,'XTickLabel','');                                   % --
set(ha4, 'YGrid', 'On');                                    % --
%title('Температура КТ-5');
ylabel (ax4,'t, \circС', 'Color', 'blue', 'FontSize', 10);  % --

hp5 = plot(ax5, date, TMP5, 'g', 'LineWidth', 1);           % --
ha5 = get(hp5,'Parent');                                    % --
set(ha5, 'XLim', [min(date) max(date)]);                    % --
set(ha5, 'YLim', [min(TMP5)-0.05 max(TMP5)+0.05]);          % --
Data5 = get(ha5,'XTick');                                   % Читаем данные под осью Х
timestr5 = datestr(Data5,13);                               % Переводим в формат даты
set(ha5,'XTickLabel',timestr5);                             % Задаем данные под осью Х (только для 5 оси!)
set(ha5, 'YGrid', 'On');                                    % --
%title('Температура КТ-6');
ylabel (ax5,'t, \circС', 'Color', 'blue', 'FontSize', 10);  % --
%-----------------------------------------------------------------------

%--------- Функция открытия файла с данными температуры ----------------
function [C] = fileopen (file)
    fid = fopen(file);                                                      % Открываем файл
    while ~feof(fid)
        C = textscan(fid, '%n %n %n %n %n %n %n %n %s','delimiter',',');    % Считываем данные с разбиваем через ","
    end
    fclose(fid);
%-----------------------------------------------------------------------

%-- Функуция обработки (открытия) кнопок выбора количества точек для ---
%-- построения графика температуры -------------------------------------
function open_btn (hObject, eventdata, handles, strlen)

if strlen > 1000                                % Если число строк в файле
    set(handles.btn_1000, 'Enable', 'On');      % больше величины, задаваемой кнопкой,
    set(handles.btn_500, 'Enable', 'On');       % открываем данную кнопку
    set(handles.btn_200, 'Enable', 'On');       % (везде аналогично)
    set(handles.btn_100, 'Enable', 'On');       % --
    set(handles.btn_50, 'Enable', 'On');        % --
    set(handles.btn_10, 'Enable', 'On');        % --
    set(handles.btn_all, 'Enable', 'On');       % --
elseif strlen > 500                             % --
    set(handles.btn_1000, 'Enable', 'Off');     % --
    set(handles.btn_500, 'Enable', 'On');       % --
    set(handles.btn_200, 'Enable', 'On');       % --
    set(handles.btn_100, 'Enable', 'On');       % --
    set(handles.btn_50, 'Enable', 'On');        % --
    set(handles.btn_10, 'Enable', 'On');        % --
    set(handles.btn_all, 'Enable', 'On');       % --
elseif strlen > 200                             % --
    set(handles.btn_1000, 'Enable', 'Off');     % --
    set(handles.btn_500, 'Enable', 'Off');      % --
    set(handles.btn_200, 'Enable', 'On');       % --
    set(handles.btn_100, 'Enable', 'On');       % --
    set(handles.btn_50, 'Enable', 'On');        % --
    set(handles.btn_10, 'Enable', 'On');        % --
    set(handles.btn_all, 'Enable', 'On');       % --
elseif strlen > 100                             % --
    set(handles.btn_1000, 'Enable', 'Off');     % --
    set(handles.btn_500, 'Enable', 'Off');      % --
    set(handles.btn_200, 'Enable', 'Off');      % --
    set(handles.btn_100, 'Enable', 'On');       % --
    set(handles.btn_50, 'Enable', 'On');        % --
    set(handles.btn_10, 'Enable', 'On');        % --
    set(handles.btn_all, 'Enable', 'On');       % --
elseif strlen > 50                              % --
    set(handles.btn_1000, 'Enable', 'Off');     % --
    set(handles.btn_500, 'Enable', 'Off');      % --
    set(handles.btn_200, 'Enable', 'Off');      % --
    set(handles.btn_100, 'Enable', 'Off');      % --
    set(handles.btn_50, 'Enable', 'On');        % --
    set(handles.btn_10, 'Enable', 'On');        % --
    set(handles.btn_all, 'Enable', 'On');       % --
elseif strlen > 10                              % --
    set(handles.btn_1000, 'Enable', 'Off');     % --
    set(handles.btn_500, 'Enable', 'Off');      % --
    set(handles.btn_200, 'Enable', 'Off');      % --
    set(handles.btn_100, 'Enable', 'Off');      % --
    set(handles.btn_50, 'Enable', 'Off');       % --
    set(handles.btn_10, 'Enable', 'On');        % --
    set(handles.btn_all, 'Enable', 'On');       % --
else
    set(handles.btn_1000, 'Enable', 'Off');     % --
    set(handles.btn_500, 'Enable', 'Off');      % --
    set(handles.btn_200, 'Enable', 'Off');      % --
    set(handles.btn_100, 'Enable', 'Off');      % --
    set(handles.btn_50, 'Enable', 'Off');       % --
    set(handles.btn_10, 'Enable', 'Off');       % --
    set(handles.btn_all, 'Enable', 'On');       % --
end
%-----------------------------------------------------------------------

%------------ Обработка событий кнопки "Обновить график" ---------------
function btn_plot_energy_Callback(hObject, eventdata, handles) 

global data_table;      % Данные таблицы
%global ax_resource;

if (get(handles.EXCELenable_check, 'Value'))

    excel_open(hObject, eventdata, handles);            % Читаем файл Excel
    plot_LabMax(hObject, eventdata, handles);           % Строим график LabMax
    resource_plot(hObject, eventdata, handles);         % Строим график ресурса
    resource_plot(hObject, eventdata, handles);         % повторно
    resource_short_plot(hObject, eventdata, handles);   % Строим укороченный график ресурса
    resource_short_plot(hObject, eventdata, handles);   % повторно

    if get(handles.show_panel_check, 'Value')           % Если флажок "Show table" ВКЛ
        set(handles.excel_table, 'Data', data_table);   % Обновляем данные в таблице
    end

    save_image(hObject, eventdata, handles);            % Сохраняем окно как изображение
    
end
%set(TemperaturePlot, 'PaperPosition', [.25 .25 35 17]);
%-----------------------------------------------------------------------

%------------------- Функция построения графика LabMax -----------------
function plot_LabMax(hObject, eventdata, handles)

global file_LabMax;         % Лог-файл LabMax
global ax_energy;           % Ось графика LabMax
global len;                 % Количество отображаемых точек
global M_len;               % Количество точек в файле
global nrg_line;            % Цвет линии энергии
global mean_nrg_line;       % Цвет линии средней энергии
global ax_color;            % Цвет окна графика
global grid_color;          % Цвет сетки
global R;
global cnt;

M = csvread(file_LabMax, 3, 0);                         % Читаем лог-файл
M_len = length(M);                                      % Определяем число точек в файле
choose_energy_plot_len(hObject, eventdata, handles)     % Выбираем число точек для отображения

if length(M) <= len+1                   % Если в файле мало точек
    X = M(:,1);                         % Выбираем все
    Y = M(:,2)*1e3;                     % --
    min_x = 0;                          % Задаемм пределы по оси Х
    max_x = len;                        % --
else
    X = M(length(M)-len:end,1);         % Выбираем последние n точек
    Y = M(length(M)-len:end,2)*1e3;     %
    min_x = min(X);                     % Задаемм пределы по оси Х       
    max_x = max(X);                     % --
end

X1 = [min_x max_x];         % Данные для линии средней энергии
Y1 = [mean(Y) mean(Y)];     % --

hp6 = plot(ax_energy, X, Y, nrg_line, X1, Y1, mean_nrg_line);   % Строим график
set(hp6(2), 'LineWidth', 2);                                    % Задаем толщину линии ср. энергии

if get(handles.mean_nrg_line_check, 'Value')
    set(hp6(2), 'Visible', 'on');
else
    set(hp6(2), 'Visible', 'off');
end

ha6 = get(hp6,'Parent');                                        % Получаем параметры объекта
set(ax_energy, 'XLim', [min_x max_x]);                          % Задаем пределы по оси Х
set(ax_energy, 'YLim', [min(Y)-0.1 max(Y)+0.1]);                % и Y
Data6 = get(ax_energy,'XTick');                                 % Читаем данные под осью Х
set(ax_energy,'XTickLabel',Data6);                              % Задаем данные под осью Х
set(ax_energy, 'Color', ax_color);                              % Задаем цвет линии энергии
set(ax_energy, 'YGrid', 'On');                                  % Включаем сеткук по оси Y
set(ax_energy, 'XGrid', 'On');                                  % и оси Х
ax_energy.GridColor = grid_color;                               % Задаем цвет сетки
set(ax_energy,'GridAlphaMode', 'manual');                       % Задаем параметр сетки
ax_energy.GridAlpha = 0.5;                                      % Задаем (вроде как прозрачность)
set(ax_energy, 'GridLineStyle', '--');                          % Задаем слить линии сетки
set(ax_energy, 'FontSize', 11);                                 % Задаем размер шрифта
set(ax_energy, 'UIContextMenu', handles.context_lineColor);     % Включаем контекстное меню

ylabel(ax_energy,'Energy, mJ', 'Color', 'b', 'FontSize', 11);   % Подпись оси Y
xlabel(ax_energy,'Shots', 'Color', 'b', 'FontSize', 11);        % Подпись оси X

set(handles.lbl_current_energy, 'String', sprintf('%.1f', Y(length(Y))))    % Выводим текущую энергию,
set(handles.lbl_min_energy, 'String', sprintf('%.1f', min(Y)));             % минимальную,
set(handles.lbl_max_energy, 'String', sprintf('%.1f', max(Y)));             % максимальную,
set(handles.lbl_mean_energy, 'String', sprintf('%.1f', mean(Y)));           % среднюю;
set(handles.lbl_count_energy, 'String', sprintf('%.f', X(length(X))));      % значение счетчика

if ~(get(handles.EXCELenable_check, 'Value'))
    R = 0;
end

if X(length(X)) >= cnt
    Res = R + (X(length(X)) - cnt);
else
    Res = R + X(length(X));
end

Res = num2str(Res);

if length(Res) == 4
    Res = strcat(Res(1), 32, Res(2:4));
elseif length(Res) == 5
    Res = strcat(Res(1:2), 32, Res(3:5));
elseif length(Res) == 6
    Res = strcat(Res(1:3), 32, Res(4:6));
elseif length(Res) == 7
    Res = strcat(Res(1), 32, Res(2:4), 32, Res(5:7));
elseif length(Res) == 8
    Res = strcat(Res(1:2), 32, Res(3:5), 32, Res(6:8));
elseif length(Res) == 9
    Res = strcat(Res(1:3), 32, Res(4:6), 32, Res(7:9));
else
    Res = Res;
end

%Res = strcat(Res(1:2), 32, Res(3:5), 32, Res(6:8));   %%%%%% *3) (для ТО)

set(handles.lbl_resource, 'String', Res);

%-----------------------------------------------------------------------

%-- Обработка нажатия на выпадающий список выбора количества точек -----
%-- графика LabMax -----------------------------------------------------
function menu_number_shot_point_Callback(hObject, eventdata, handles)
global ax_energy;
cla(ax_energy);
%-----------------------------------------------------------------------

%-- Функция выбора количества точек для построения графика LabMax ------
function choose_energy_plot_len(hObject, eventdata, handles)

global len;
global M_len;
num = get(handles.menu_number_shot_point, 'Value');
switch num
    case 1
        len = 1000;
    case 2
        len = 5000;
    case 3
        len = 10000;
    case 4
        len = 20000;
    case 5
        len = 50000;
    case 6
        len = 100000;
    case 7
        len = 200000;
    case 8
        len = M_len;
end
%-----------------------------------------------------------------------

%----- Функция открытия файла EXEL и чтения данных для таблицы ---------
function excel_open(hObject, eventdata, handles)

global XLPath;
global resourse;
global energy_start;
global energy_stop;
global tmp;
global data_table;
global cnt;
global R;

try
    data = xlsread(XLPath); 
catch
    handles.ErrorLog_lbl.String = 'Error opening EXCEL file!';
end

start_row = 6;
test_res = data(1:end,5);                                     %%%%%%%%%%  Для ТВИ
noth = isnan(test_res(length(test_res)));                     %%%%%%%%%%    
 
while noth
    data = data(1:end-1,:);                                   %%%%%%%%%%
    test_res = data(1:end,5);                                 %%%%%%%%%%
    noth = isnan(test_res(length(test_res)));                 %%%%%%%%%%
end

resourse = data(start_row:end,5);
energy_start = data(start_row:end,6);
energy_stop = data(start_row:end,7);
tmp = data(start_row:end,16);

time = data(start_row:end,2);
bar = data(start_row:end,3);
count = data(start_row:end,4);
t1 = data(start_row:end,9);
t2 = data(start_row:end,10);
t3 = data(start_row:end,11);
tp2 = data(start_row:end,13);
tp3 = data(start_row:end,14);
tp4 = data(start_row:end,16);   
tp5 = data(start_row:end,17);
tp6 = data(start_row:end,15);

if length(resourse) > 19                %%%%%%%%%%%
    str_num = 19;                       %%%%%%%%%%%
else
    str_num = length(resourse)-1;       %%%%%%%%%%%
end;

data_table = nan(str_num+1,14);

time = time(length(resourse)-str_num:end);
data_table(:,2) = bar(length(resourse)-str_num:end);
data_table(:,3) = count(length(resourse)-str_num:end);
data_table(:,4) = resourse(length(resourse)-str_num:end);
data_table(:,5) = energy_start(length(resourse)-str_num:end);
data_table(:,6) = energy_stop(length(resourse)-str_num:end);
data_table(:,7) = t1(length(resourse)-str_num:end);
data_table(:,8) = t2(length(resourse)-str_num:end);
data_table(:,9) = t3(length(resourse)-str_num:end);
data_table(:,10) = tp2(length(resourse)-str_num:end);
data_table(:,11) = tp3(length(resourse)-str_num:end);
data_table(:,12) = tp4(length(resourse)-str_num:end);
data_table(:,13) = tp5(length(resourse)-str_num:end);
data_table(:,14) = tp6(length(resourse)-str_num:end);
data_table = num2cell(data_table);



for i=1:1:length(time)
    
    try
    data_table{i,1} = datestr(datenum(time(i)), 15);  
    catch
    data_table{i,1} = '';    
    end
    
end

%length(data_table)--> str_num+1

if isnan(data_table{str_num+1,2})                               % Если последняя стркоа столбца "Давление" пустая (нет значения)
    set(handles.lbl_bar, 'String', 'ON AIR');                   % Выводим сообщени о том, что стреляем на воздухе
    set(handles.lbl_bar, 'BackgroundColor', 'Y');               % и красим соответствующее поле в желтый
else
    set(handles.lbl_bar, 'String', 'VACUUM');                   % иначе выводим сообщение о том, что стреляем в вакууме
    set(handles.lbl_bar, 'BackgroundColor', 'M');               % и красим соответствующее поле в розовый               
end

for i=1:1:length(data_table(:,2))               % Пробегаемся по всему столбцу "Давление"
    if isnan(data_table{i,2})                   % Если стркоа столбца "Давление" пустая (нет значения)
        data_table{i,2} = '      ON AIR';       % пишем в нее "На воздухе"
    end
end

noth = isnan(resourse(length(resourse)));

if noth
    R = resourse(length(resourse)-1);
    cnt = count(length(resourse)-1);
else
    R = resourse(length(resourse));
    cnt = count(length(resourse));
end

%-----------------------------------------------------------------------

%-------------- Функция построения графика ресурса ---------------------
function resource_plot(hObject, eventdata, handles)

global ax_resource;
global resourse;
global energy_start;
global energy_stop;
global tmp;
global R;

%set(handles.lbl_resource, 'String', sprintf('%.0f', R));

yyaxis(ax_resource, 'left');

hp7 = plot(ax_resource, resourse, energy_start, '-g', resourse, energy_stop, '-r', 'LineWidth', 2);
set(ax_resource, 'ycolor', 'r');
ylabel(ax_resource,'Energy, mJ', 'Color', 'r', 'FontSize', 11);

yyaxis(ax_resource, 'right');

hp8 = plot(ax_resource, resourse, tmp, '-b', 'LineWidth', 2);
set(ax_resource, 'ycolor', 'b');
ylabel(ax_resource,'Temperature, \circ C', 'Color', 'b', 'FontSize', 11);

ha7 = get(hp7,'Parent');
Data7 = get(ax_resource,'XTick');   % тут завис
Data7 = num2str(Data7');
set(ax_resource,'XTickLabel',Data7);
set(ax_resource, 'XLim', [min(resourse) max(resourse)]);
set(ax_resource, 'YLim', [0 max(tmp)]);
set(ax_resource, 'Color', 'w');
set(ax_resource, 'YGrid', 'On');
%set(ax_resource, 'XGrid', 'On');
ax_resource.GridColor = 'k';
set(ax_resource,'GridAlphaMode', 'manual');
ax_resource.GridAlpha = 0.5;
set(ax_resource, 'GridLineStyle', '--');
set(ax_resource, 'FontSize', 10);

xlabel(ax_resource,'Shots', 'Color', 'k', 'FontSize', 10);
legend(ax_resource,'Estart', 'Estop', 'Temperature');
%-----------------------------------------------------------------------

%--------- Функция построения укороченного графика ресурса -------------
function resource_short_plot(hObject, eventdata, handles)

global ax_short_resource;
global resourse;
global energy_start;
global energy_stop;
global tmp;

global last_resource;

choose_resurs_plot_len(hObject, eventdata, handles);

resourse_sh = resourse(length(resourse)-last_resource:end);
energy_start_sh = energy_start(length(energy_start)-last_resource:end);
energy_stop_sh = energy_stop(length(energy_stop)-last_resource:end);
tmp_sh = tmp(length(tmp)-last_resource:end);

yyaxis(ax_short_resource, 'left');
hp9 = plot(ax_short_resource, resourse_sh, energy_start_sh, '-g', resourse_sh, energy_stop_sh, '-r', 'LineWidth', 2);
set(ax_short_resource, 'ycolor', 'r');
ylabel(ax_short_resource,'Energy, mJ', 'Color', 'r', 'FontSize', 11);

yyaxis(ax_short_resource, 'right');
hp10 = plot(ax_short_resource, resourse_sh, tmp_sh, '-b', 'LineWidth', 2);
set(ax_short_resource, 'ycolor', 'b');
ylabel(ax_short_resource,'Temperature, \circ C', 'Color', 'b', 'FontSize', 11);

ha9 = get(hp9,'Parent');
set(ax_short_resource, 'XTickLabelMode', 'Auto');
Data8 = get(ax_short_resource,'XTick'); 
Data8 = num2str(Data8');
set(ax_short_resource,'XTickLabel',Data8);
set(ax_short_resource, 'XLim', [min(resourse_sh) max(resourse_sh)]);
set(ax_short_resource, 'YLim', [0 max(tmp_sh)]);
set(ax_short_resource, 'Color', 'w');
set(ax_short_resource, 'YGrid', 'On');
%set(ax_resource, 'XGrid', 'On');
ax_short_resource.GridColor = 'k';
set(ax_short_resource,'GridAlphaMode', 'manual');
ax_short_resource.GridAlpha = 0.5;
set(ax_short_resource, 'GridLineStyle', '--');
set(ax_short_resource, 'FontSize', 10);

xlabel(ax_short_resource,'Shots', 'Color', 'k', 'FontSize', 10);
legend(ax_short_resource,'Estart', 'Estop', 'Temperature');
%-----------------------------------------------------------------------

%--- Функция выбора количества точек для построения графика ресурса ----
function choose_resurs_plot_len(hObject, eventdata, handles)

global last_resource;
global resourse;

num = get(handles.menu_number_strings, 'Value');
switch num
    case 1
        if length(resourse)-1 > 50
            last_resource = 50;
        else
            last_resource = length(resourse)-1;
        end;
        
    case 2
        if length(resourse)-1 > 100
            last_resource = 100;
        else
            last_resource = length(resourse)-1;
        end;
        
    case 3
        if length(resourse)-1 > 200
            last_resource = 200;
        else
            last_resource = length(resourse)-1;
        end;
        
    case 4
        if length(resourse)-1 > 300
            last_resource = 300;
        else
            last_resource = length(resourse)-1;
        end;
        
    case 5
        if length(resourse)-1 > 400
            last_resource = 400;
        else
            last_resource = length(resourse)-1;
        end;

    case 6
        if length(resourse)-1 > 500
            last_resource = 500;
        else
            last_resource = length(resourse)-1;
        end;

    case 7
        if length(resourse)-1 > 700
            last_resource = 700;
        else
            last_resource = length(resourse)-1;
        end;

    case 8
        if length(resourse)-1 > 1000
            last_resource = 1000;
        else
            last_resource = length(resourse)-1;
        end;
 
    case 9
        if length(resourse)-1 > 2000
            last_resource = 2000;
        else
            last_resource = length(resourse)-1;
        end;

    case 10
        if length(resourse)-1 > 5000
            last_resource = 5000;
        else
            last_resource = length(resourse)-1;
        end;

    case 11
        last_resource = length(resourse)-1;
end
%-----------------------------------------------------------------------

%-- Обработка событий выпадающего меню выбора количества последних строк
%-- для построения укороченного графика ресурса ------------------------
function menu_number_strings_Callback(hObject, eventdata, handles)

global ax_short_resource;

if (get(handles.EXCELenable_check, 'Value'))
    
    yyaxis(ax_short_resource, 'left');
    cla(ax_short_resource);

    yyaxis(ax_short_resource, 'right');
    cla(ax_short_resource);

    set(ax_short_resource,'XTickLabel','');
    set(ax_short_resource,'YTickLabel','');

    resource_short_plot(hObject, eventdata, handles);
    resource_short_plot(hObject, eventdata, handles);
    
end
%-----------------------------------------------------------------------

%--------------- Обработка событий флажка "Show panel" -----------------
function show_panel_check_Callback(hObject, eventdata, handles)

global data_table;

if get(handles.show_panel_check, 'Value')           %Если флажок "Show panel" ВКЛ
    set(handles.excel_panel, 'Visible', 'On');      %Активируем панель
    set(handles.excel_table, 'Data', data_table);   %Заполняем таблицу
else
    set(handles.excel_panel, 'Visible', 'Off');     %иначе скрываем панель
end
%-----------------------------------------------------------------------

%------- Функция сохранения рабочей области как изображения ------------
function save_image(hObject, eventdata, handles)
print(gcf,'-dpng','d:\! RESURS_2018\Photo_matlab.png');
%-----------------------------------------------------------------------

%----------- Обработка событий кнопки "Show scheme" -------------------
function check_scheme_Callback(hObject, eventdata, handles)

if get(handles.check_scheme, 'Value')
    set(handles.pic_panel, 'Visible', 'On');
else
    set(handles.pic_panel, 'Visible', 'Off');
end
%----------------------------------------------------------------------

%----------- Обработка событий кнопки "Show line" -------------------
function mean_nrg_line_check_Callback(hObject, eventdata, handles)
%--------------------------------------------------------------------

% ----------- Обработка событий кнопки "Построить" --------------------
function btn_keeper_log_plot_Callback(hObject, eventdata, handles)
global file_ResursKeeper;
keeper_graph = figure;
ax_keeper = axes(keeper_graph);
pos = get(ax_keeper, 'Position');
pos1=0.5;
pos(2)=pos(2)+pos1; 
pos(4)=pos(4)-pos1;
set(ax_keeper,'position',pos);
pos(2)=pos1-0.37; 
ax_keeper(2)=axes('position',pos);


fid = fopen(file_ResursKeeper);                                        
while ~feof(fid) 
    Ce = textscan(fid, '%s %s %n %n %n %n %n %n %n %n %n %n %n %n','delimiter',',');
end
fclose(fid);


%[date,time] = strtok(Ce{1,1}, ', ');
[day,rem]=strtok(Ce{1,1}, '-');  % дату и время
[month,rem]=strtok(rem, '-');      % --
year=strtok(rem, '-');            % --
time = Ce{1,2};    

date_Kep = [];

for i=1:1:length(day)
    temp = ((strcat('20', year{i}, '-', month{i}, '-', day{i}, 32, time{i})));
    date_Kep = [date_Kep; temp];
end

date_Keeper = datenum(date_Kep);

CountTh = Ce{1,3};
MeanNRG = Ce{1,4};
EndNRG = Ce{1,5};
StartNRG = Ce{1,6};

CountThPlot = [];
MeanNRGPlot = [];
EndNRGPlot = [];
StartNRGPlot = [];


for i=1:1:length(CountTh)
    if mod(CountTh(i), 1000) == 0
        CountThPlot = [CountThPlot CountTh(i)];
        MeanNRGPlot = [MeanNRGPlot MeanNRG(i)];
        EndNRGPlot = [EndNRGPlot EndNRG(i)];
        StartNRGPlot = [StartNRGPlot StartNRG(i)];
    end
end

X = [CountThPlot', CountThPlot', CountThPlot'];            % X - столбец
Y = [MeanNRGPlot', EndNRGPlot', StartNRGPlot'];

%hp_K = stairs(ax_keeper(1), X, Y, 'LineWidth', 2);
hp_K = plot(ax_keeper(1), CountThPlot, MeanNRGPlot, CountThPlot, EndNRGPlot, CountThPlot, StartNRGPlot, 'LineWidth', 2);
ha_K = get(hp_K,'Parent');
set(hp_K(1), 'Color', 'b', 'Marker', 'o', 'MarkerFaceColor', 'b');
set(hp_K(2), 'Color', 'r', 'Marker', '*', 'MarkerFaceColor', 'r');
set(hp_K(3), 'Color', 'g', 'Marker', 'd', 'MarkerFaceColor', 'g');
set(ax_keeper(1), 'XLim', [min(Ce{1,3}) max(Ce{1,3})]);
Data_K = get(ax_keeper(1),'XTick');
timestr_K = num2str(Data_K');
set(ax_keeper(1),'XTickLabel',timestr_K);
set(ax_keeper(1), 'YGrid', 'On', 'XGrid', 'On');                                             
title(ax_keeper(1), 'ENEGRY');
xlabel(ax_keeper(1),'Shots', 'Color', 'blue', 'FontSize', 11)
ylabel(ax_keeper(1),'Energy, mJ', 'Color', 'blue', 'FontSize', 11);
legend(ax_keeper(1), 'Emean', 'Estop', 'Estart');
ax_keeper(1).Legend.Orientation = 'Horizontal';
ax_keeper(1).Legend.Location = 'Best';


yyaxis(ax_keeper(2), 'left');
hp_T = plot(ax_keeper(2), date_Keeper, Ce{1,8}, '-b', date_Keeper, Ce{1,9}, '-c', date_Keeper, Ce{1,10}, '-r', date_Keeper, Ce{1,11}, '-m', date_Keeper, Ce{1,12}, '-g','LineWidth', 2);
ylabel(ax_keeper(2),'t, \circС', 'Color', 'blue', 'FontSize', 11);
set(ax_keeper(2), 'ycolor', 'b');

yyaxis(ax_keeper(2), 'right');
hp_T1 = plot(ax_keeper(2), date_Keeper, Ce{1,10}, '-r','LineWidth', 2);
set(ax_keeper(2), 'ycolor', 'r');


set(ax_keeper(2), 'XLim', [min(date_Keeper) max(date_Keeper)]);
Data_T = get(ax_keeper(2),'XTick');
timestr_T = datestr(Data_T,0);
set(ax_keeper(2),'XTickLabel',timestr_T);
set(ax_keeper(2), 'YGrid', 'On', 'XGrid', 'On'); 
title(ax_keeper(2), 'TEMPERATURE');
xlabel(ax_keeper(2),'Time', 'Color', 'blue', 'FontSize', 11)
ylabel(ax_keeper(2),'t КТ-4, \circС', 'Color', 'blue', 'FontSize', 11);
legend(ax_keeper(2), 'КТ_2 (Радиатор излучателя)', 'КТ_3 (радиатор БД, БП ЛПБ)', 'КТ_4 (крышка излучателя)', 'КТ_5 (БП ЛПБ)', 'КТ_6 (БД)');
ax_keeper(2).Legend.Orientation = 'Horizontal';
ax_keeper(2).Legend.Location = 'Best';
%----------------------------------------------------------------------

%-------------------------- For work with Tabgroup menu -------------------
%---------------------------------------------------------------------------------
function ch_tabgroup_Callback(hObject, eventdata, handles)

    global tabgp;
    global sec_cnt;

    if handles.ch_tabgroup.Value
        %tg_CreateFcn(hObject, eventdata, handles); %%%%%%%%%%%%%%%%%%% MYYYY
         devices_ID = webcamlist;

         if ~isempty(devices_ID)
            set(handles.pm_camlist, 'String', devices_ID);
            set(handles.pm_camlist, 'Enable', 'On');
            set(handles.check_bar, 'Enable', 'On');
            set(handles.text_camname_lbl, 'String', 'Web-camera connected', 'ForegroundColor', 'b');
         else
            set(handles.text_camname_lbl, 'String', 'Web-camera not connected', 'ForegroundColor', 'r');
            set(handles.check_bar, 'Enable', 'Off');
            set(handles.pm_camlist, 'Value', 1);
            set(handles.pm_camlist, 'String', {''});
            set(handles.pm_camlist, 'Enable', 'Off');
         end
         
        tabgp.Visible = 'On';
        sec_cnt = 0;
    else
        tabgp.Visible = 'Off';
        sec_cnt = 0;
        btn_exitstat_Callback(hObject, eventdata, handles);
    end
%---------------------------------------------------------------------------------
    

    
%-------------------------- Work with Webcamera ---------------------------
%------------------------------------------------------------------------------------
function webcaminit(hObject, eventdata, handles)

global ax_bar;
global bar_pic;

try
    devices_ID = webcamlist;
    webcamnum = get(handles.pm_camlist, 'Value');
    webcam_work = webcam(devices_ID{webcamnum});
    resolutions = webcam_work.AvailableResolutions;
    webcam_work.Resolution = resolutions{1};
    bar_pic = snapshot(webcam_work);
    %bar_pic = imrotate(bar_pic, 180);
    image(ax_bar, bar_pic);
catch
    webcamclear(hObject, eventdata, handles);
    set(handles.check_bar, 'Value', 0);
    set(handles.check_bar, 'Enable', 'Off');
    set(handles.text_camname_lbl, 'String', 'Web-camera not connected', 'ForegroundColor', 'r');
    set(handles.pm_frame_bar, 'Enable', 'Off');
    set(handles.pm_frame_bar, 'Value', 4);
    set(handles.pm_camlist, 'Enable', 'Off');
    set(handles.pm_camlist, 'Value', 1);
    set(handles.pm_camlist, 'String', {''});
    return;
end

set(ax_bar, 'XTickLabel','');
set(ax_bar, 'YTickLabel','');

function webcamclear(hObject, eventdata, handles)

global ax_bar;
set(ax_bar, 'XTickLabel','');
set(ax_bar, 'YTickLabel','');
cla(ax_bar);

function check_bar_Callback(hObject, eventdata, handles)

if get(handles.check_bar, 'Value') 
    set(handles.pm_frame_bar, 'Enable', 'On');
    set(handles.pm_camlist, 'Enable', 'Off');
    webcaminit(hObject, eventdata, handles);
else
    webcamclear(hObject, eventdata, handles);
    set(handles.pm_frame_bar, 'Value', 4);
    set(handles.pm_frame_bar, 'Enable', 'Off');
    set(handles.pm_camlist, 'Enable', 'On');
end

function pm_frame_bar_Callback(hObject, eventdata, handles)

global bar_screen_frame;                            % Frame time

scr_val = get(handles.pm_frame_bar, 'Value');  % Get value from pm_menu
switch scr_val
    case 1
        bar_screen_frame = 10;
    case 2                                      % Case some frame time
        bar_screen_frame = 20;                      % 
    case 3                                      % --
        bar_screen_frame = 40;                      % --
    case 4                                      % --
        bar_screen_frame = 60;                      % --
    case 5                                      % --
        bar_screen_frame = 120;                     % --
    case 6                                      % --
        bar_screen_frame = 360;                     % --
    case 7                                      % --
        bar_screen_frame = 600;                     % --
end

% Convert cell array into a string format
function str = cell2str(c)
nblanks = cellfun(@length, c);
maxn = max(nblanks);
nblanks = maxn-nblanks; 
padding = cellfun(@blanks,num2cell(nblanks), 'UniformOutput', false);
str = {c{:}; padding{:}};
str = [str{:}];
ncols = maxn;
nrows = length(str)/ncols;
str = reshape(str,ncols,nrows)';
%------------------------------------------------------------------------------------



%------------------------------ Work with STATISTIC ----------------------------------
%-------------------------------------------------------------------------------------
function btn_helloworld_Callback(hObject, eventdata, handles)
global ax_SU;
global sec_cnt;
sec_cnt = sec_cnt + 1;

handles.helloworld_lbl.ForegroundColor = 'b';
handles.helloworld_lbl.String = 'Hello, world!';

if sec_cnt == 12
    handles.helloworld_lbl.ForegroundColor = 'r';
    handles.helloworld_lbl.String = 'Super user mode activated!';
    handles.helloworld_lbl_clc.String = 'Ах ты ж хитрый читер! Ля чего натыкал';
    handles.btn_stat1.Visible = 'On';
    handles.btn_stat2.Visible = 'On';
    handles.btn_exitstat.Visible = 'On';
    handles.btn_helloworld.Enable = 'Off';
    handles.btn_helloworld_clc.Enable = 'Off';
    handles.check_screen.Value = 0;%
    sec_cnt = 0;
    try
        img = imread('d:\loboda\memchiki\SU2.jpg');       % Set SU image
        image(ax_SU, img);                                % Show image on axis
    catch
        handles.ErrorLog_lbl.String = 'd:\loboda\memchiki\SU2.jpg not found!';
    end
    set(ax_SU, 'Visible', 'off');                     % Set axis unseeable (default) 
   
end

function btn_helloworld_clc_Callback(hObject, eventdata, handles)
global sec_cnt;
sec_cnt = 0;

handles.helloworld_lbl.String = '';

function btn_stat1_Callback(hObject, eventdata, handles)
global plot_select;
plot_select = 1;
try
    get_statistic(hObject, eventdata, handles);
catch
end

function btn_stat2_Callback(hObject, eventdata, handles)
global plot_select;
plot_select = 2;
try
    get_statistic(hObject, eventdata, handles);
catch
end

function btn_exitstat_Callback(hObject, eventdata, handles)
global ax_SU;
global sec_cnt;
sec_cnt = 0;

handles.btn_stat1.Visible = 'Off';
handles.btn_stat2.Visible = 'Off';
handles.btn_exitstat.Visible = 'Off';
handles.btn_helloworld.Enable = 'On';
handles.btn_helloworld_clc.Enable = 'On';
handles.check_screen.Value = 1;%

handles.helloworld_lbl_clc.String = 'Любишь кнопочки тыкать - люби и за собой стирать!';
handles.helloworld_lbl.String = '';
cla(ax_SU);

% Get statistic from file and plot diagram
function get_statistic(hObject, eventdata, handles)
global plot_select;

fullpath = 'd:\! RESURS_2018\ResursKeeperLogs\requestStatistics\requests.txt';      % Full pats to statistic file

file_stat = fopen(fullpath);                                    % Open file
while ~feof(file_stat) 
    Stat = textscan(file_stat, '%s %s %d','delimiter',';');     % Read file with delimiter ';'
end
fclose(file_stat);

Names = Stat{1,1};                                              % Select usernames
Commands = Stat{1,2};                                           % Select commands
NumberOfRequests = Stat{1,3};                                   % Select numder of command requests

for i=1:1:length(Names)
    
    if strcmp(Names{i,1}, '')
        Names{i,1} = 'Agent 007';
    else
        Names{i,1} = DECODER(Names{i,1});                           % Convert to UTF-8 (to display russian names)
    end
          
end

Date = cell(1,2);
Date{1,1} = Names{1,1};                                         % 1-st username

for k = 2:1:length(Names)
      if ~strcmp(Names{k,1}, Names{k-1,1})
          Date{size((Date), 1) + 1, 1} = Names{k,1};            % Search all usersnames
      end
end

for i = 1:1:size((Date), 1)                                     % For all usernames

   cmd_SCREEN = NaN;
   cmd_TEST = NaN;
   cmd_SKOLKO = NaN;
   cmd_GETMEM = NaN;
   cmd_PIC = NaN;
   cmd_PICALL = NaN;
   cmd_TELEMETRY = NaN;
   cmd_OTHER = NaN;
   cmd_SCREENSHOT = NaN;
   
   for j = 1:1:length(Names)
        if strcmp(Date{i,1}, Names{j,1})                       % Search request commands and its numbers
            
            if strcmp(Commands{j,1}, 'SCREEN')
                cmd_SCREEN = NumberOfRequests(j);
            elseif strcmp(Commands{j,1}, 'TEST')
                cmd_TEST = NumberOfRequests(j);
            elseif strcmp(Commands{j,1}, 'SKOLKO')
                cmd_SKOLKO = NumberOfRequests(j);
            elseif strcmp(Commands{j,1}, 'GETMEM')
                cmd_GETMEM = NumberOfRequests(j);
            elseif strcmp(Commands{j,1}, 'PIC')
                cmd_PIC = NumberOfRequests(j);
            elseif strcmp(Commands{j,1}, 'PICALL')
                cmd_PICALL = NumberOfRequests(j);
            elseif strcmp(Commands{j,1}, 'TELEMETRY')
                cmd_TELEMETRY = NumberOfRequests(j);
            elseif strcmp(Commands{j,1}, 'OTHER')
                cmd_OTHER = NumberOfRequests(j);
            elseif strcmp(Commands{j,1}, 'SCREENSHOT')
                cmd_SCREENSHOT = NumberOfRequests(j);
            end
            
        end
   end
   
   Date{i,2} = [cmd_SCREEN cmd_PICALL cmd_PIC cmd_TELEMETRY cmd_SKOLKO cmd_TEST cmd_OTHER cmd_GETMEM cmd_SCREENSHOT];       % Command vector
   
end

y = cell2mat(Date(:,2));

switch plot_select
    case 1
    % Plot BAR statistic diagram 
    
        if get(handles.helloworld_lbl, 'String') == "Super user mode activated!"
            StatFig = figure('Units', 'normalized', 'OuterPosition', [0 0 1 1], 'Visible', 'On');
        else
            StatFig = figure('Units', 'normalized', 'OuterPosition', [0 0 1 1], 'Visible', 'Off');
        end
        
        ax_stat = axes(StatFig);

        b = barh(ax_stat, y);

        set(ax_stat, 'XGrid', 'On');
        set(ax_stat, 'XMinorGrid', 'On');
        set(ax_stat, 'YGrid', 'On');
        legend(ax_stat, 'SCREEN', 'PICALL', 'PIC', 'TELEMETRY', 'SCOLKO', 'TEST', 'OTHER', 'GETMEM', 'SCREENSHOT');
        b(1).FaceColor = 'r'; b(1).EdgeColor = 'r';
        b(2).FaceColor = [0.9290 0.6940 0.1250]; b(2).EdgeColor = [0.9290 0.6940 0.1250];
        b(3).FaceColor = 'y'; b(3).EdgeColor = 'y'; 
        b(4).FaceColor = 'g'; b(4).EdgeColor = 'g';
        b(5).FaceColor = 'c'; b(5).EdgeColor = 'c';
        b(6).FaceColor = 'b'; b(6).EdgeColor = 'b';
        b(7).FaceColor = 'm'; b(7).EdgeColor = 'm';
        b(8).FaceColor = [0.4940 0.1840 0.5560]; b(8).EdgeColor = [0.4940 0.1840 0.5560];
        b(9).FaceColor = 'k'; b(9).EdgeColor = 'k';

        set(ax_stat, 'YTickLabel', Date(:,1));
        xlabel(ax_stat, 'Number of requests', 'Color', 'b');
        ylabel(ax_stat, 'Usernames', 'Color', 'b');
        title(ax_stat, 'Usernames statistic for TelegramResursBot', 'Fontsize', 18);
        
        print(StatFig,'-dpng','d:\! RESURS_2018\ResursKeeperLogs\requestStatistics\stat1.png');
        
        if get(handles.helloworld_lbl, 'String') ~= "Super user mode activated!"
            delete(StatFig);
        end
        
    case 2
    %Plot 3-d round diagram
    
        if get(handles.helloworld_lbl, 'String') == "Super user mode activated!"
            StatFigR = figure('Units', 'normalized', 'OuterPosition', [0 0 1 1], 'Visible', 'On');
        else
            StatFigR = figure('Units', 'normalized', 'OuterPosition', [0 0 1 1], 'Visible', 'Off');
        end

        ax_statR = axes(StatFigR);

        yr = sum(y);
        %v = ones(1, length(yr));
        v = [0.5 1 0 0 0 0 0 0 0];
        yrlbl = num2str(yr);
        yrlbl = split(yrlbl);

        p = pie3(ax_statR, yr, v, yrlbl);
        legend(ax_statR, 'SCREEN', 'PICALL', 'PIC', 'TELEMETRY', 'SCOLKO', 'TEST', 'OTHER', 'GETMEM', 'SCREENSHOT');
        colormap(ax_statR, hsv);
        title(ax_statR, 'Commands statistic for TelegramResursBot', 'Fontsize', 18);
        
        print(StatFigR,'-dpng','d:\! RESURS_2018\ResursKeeperLogs\requestStatistics\stat2.png');
        
        if get(handles.helloworld_lbl, 'String') ~= "Super user mode activated!"
            delete(StatFigR);
        end
end

% Function for decode russian names in file
function [out_str] = DECODER(in_str)

    rus = [1040:1103 1025 1105];

    if numel(find(rus == max(abs(in_str)))) > 0
        out_str = in_str;
    else 
        a = unicode2native(in_str,'windows-1251');
        out_str = native2unicode(abs(a),'UTF-8');
    end
%--------------------------------------------------------------------------------------



% ------------------- Work with BAR pictures (recognizing) ----------------------------
% -------------------------------------------------------------------------------------
function btn_rec_Callback(hObject, eventdata, handles)
RecognizeBAR(hObject, eventdata, handles)

function btn_recpar_Callback(hObject, eventdata, handles)
global AdImLow; global AdImHigh; global AdImGamma;
global MedfiltM; global MedfiltN;
global ImbinLevel;
global MSERmin; global MSERmax; global MSERTD;

AdImLow = str2double(get(handles.ad_im_int_LOW_edit, 'String'));
AdImHigh = str2double(get(handles.ad_im_int_HIGH_edit, 'String'));
AdImGamma = str2double(get(handles.ad_im_int_GAMMA_edit, 'String'));
MedfiltM = str2double(get(handles.medfilt_M_edit, 'String'));
MedfiltN = str2double(get(handles.medfilt_N_edit, 'String'));
ImbinLevel = str2double(get(handles.BW_Level_edit, 'String'));
MSERmin = str2double(get(handles.MSER_min_edit, 'String'));
MSERmax = str2double(get(handles.MSER_max_edit, 'String'));
MSERTD = str2double(get(handles.MSER_TD_edit, 'String'));

function check_MSER_Callback(hObject, eventdata, handles)

function check_barrec_Callback(hObject, eventdata, handles)
if get(handles.check_barrec, 'Value')
    %RecognizeBAR(hObject, eventdata, handles);
else
    handles.ch1tab1_lbl.String = '';
    handles.ch2tab1_lbl.String = '';
    handles.mode1tab1_lbl.String = '';
    handles.mode2tab1_lbl.String = '';
    handles.barval1tab1_lbl.String = '';
    handles.barval2tab1_lbl.String = '';
end


function RecognizeBAR(hObject, eventdata, handles)
global bar_pic;
global ax_orig_img; global ax_proc_img; global ax_bw_img;
global MSERmin; global MSERmax; global MSERTD;

try
    %isempty(bar_pic)
    %colorImage = imread(bar_pic);     % Read image 
    colorImage = imread('TestPictures\pic5.jpg');     % Read image
catch
    %colorImage = imread('d:\! RESURS_SOFT\Worksourses\TestPictures\pic2.jpg');     % Read image
    handles.ErrorLog_lbl.String = 'Image from camera not found! Work with test image';
end

% Original image
% figure;
image(ax_orig_img, colorImage);
set(ax_orig_img, 'Visible', 'off');         % Set axis unseeable (default) 
% impixelregion
% title('Original RGB image');

R = colorImage(:,:,1);              % Select R color
I = rgb2gray(colorImage);           % Convert RGB image to GRAY
S = size(I);                        % Get gray image matrix size

Thresh = 190;                       % Brightness threshold for R color

% Select RED regions on image:
% if R_pixel_color < Thresh
    % pixel_gray_image = 255
% else
    % pixel_gray_image = 0
    
for l=1:S(1)
    for k=1:S(2)
        if R(l,k) < Thresh
            I(l,k) = 255;
        else
            I(l,k) = 0;
        end
    end
end

% BW image 
%figure;
%imshow(I);
%title('BW image');
 
% Use some filters 
I = imadjust(I, [50 150]/255, [ ], 1);
I = medfilt2(I, [5 5]);
I = imadjust(I, [50 150]/255, [ ], 1);

% BW image after some processing
% figure;
% imshow(I);
% title('BW image after some processing');

I = ~ImagePrew(colorImage); %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Detect MSER regions
    % MSERmin - MIN RegionAreaRange
    % MSERmax - MAX RegionAreaRange
    % MSERTD - ThresholdDelta

[mserRegions, mserConnComp] = detectMSERFeatures(I, ...
                               'RegionAreaRange',[MSERmin MSERmax],...
                               'ThresholdDelta',MSERTD);

if get(handles.check_MSER, 'Value')
    ff = figure();
    imshow(I);
    colormap(ff, gray(2));
    hold on;
    plot(mserRegions, 'showPixelList', true,'showEllipses',false);
    title('MSER regions');
    hold off;
end

% Use regionprops to measure MSER properties
mserStats = regionprops(mserConnComp, 'BoundingBox', 'Eccentricity', ...
                        'Solidity', 'Extent', 'Euler', 'Image');

% Compute the width and height using bounding box data.
bbox = vertcat(mserStats.BoundingBox);
x = bbox(:,1);                          % X region position
y = bbox(:,2);                          % Y region position
w = bbox(:,3);                          % width (in pixels)
h = bbox(:,4);                          % height (in pixels)

NumRegions = length(w);

%y_min = min(y);
%y_max = max(y);
mean_line = (min(y) + max(y))/2;

Uc = cell(1,1);
Uc{1,1} = 'Up regions';

Dc = cell(1,1);
Dc{1,1} = 'Down regions';

for k=1:1:NumRegions
    
    if y(k) < mean_line
        sUc = size(Uc);
        Uc{sUc(1)+1, 1} = k;
    else
        sDc = size(Dc);
        Dc{sDc(1)+1, 1} = k;
        
    end
end
    
[S11 S12 S13 S14 S15 S16 S17] = StringRecognize(Uc, x, mserStats);
[S21 S22 S23 S24 S25 S26 S27] = StringRecognize(Dc, x, mserStats);

handles.ch1_lbl.String = num2str(S11);
handles.ch2_lbl.String = num2str(S21);
handles.mode1_lbl.String = S12;
handles.mode2_lbl.String = S22;
handles.barval1_lbl.String = strcat(num2str(S13), '.', num2str(S14), num2str(S15), 'e', S16, '0', num2str(S17));
handles.barval2_lbl.String = strcat(num2str(S23), '.', num2str(S24), num2str(S25), 'e', S26, '0', num2str(S27));

if get(handles.check_barrec, 'Value')
    handles.ch1tab1_lbl.String = num2str(S11);
    handles.ch2tab1_lbl.String = num2str(S21);
    handles.mode1tab1_lbl.String = S12;
    handles.mode2tab1_lbl.String = S22;
    handles.barval1tab1_lbl.String = strcat(num2str(S13), '.', num2str(S14), num2str(S15), 'e', S16, '0', num2str(S17));
    handles.barval2tab1_lbl.String = strcat(num2str(S23), '.', num2str(S24), num2str(S25), 'e', S26, '0', num2str(S27));
end

% Recognize channel values
function [Ustr1 Ustr2 Ustr3 Ustr4 Ustr5 Ustr6 Ustr7] = StringRecognize(Uc, x, mserStats)

Mass_Up_x = [];
sUc = size(Uc);

for k=2:1:sUc(1)
    Mass_Up_x = [Mass_Up_x x(Uc{k,1})];
end

[x_sort_pos, x_firsp_pos] = sort(Mass_Up_x);
UpStr = [];

for k=1:1:length(x_firsp_pos)
    xk = x_firsp_pos(k);
    CurReg = ~mserStats(Uc{xk+1,1}).Image;
    CurNun = NumRecognize(CurReg);
    UpStr = [UpStr CurNun];
end

% Recognition 1-st number (CHANNEL)
while true
    if UpStr(1) > 10
        UpStr = UpStr(2:end);
    else
        Ustr1 = UpStr(1);
        break;
    end
end

%fprintf('Первый символ - цифра: %d\n', Ustr1);

% Recognition 2-nd number (STATE)
while true
    if UpStr(2) == 10
        Ustr2 = 'P';
        break;
    elseif UpStr(2) == 11
        Ustr2 = 'C';
        break;
    elseif UpStr(2) == 0
        Ustr2 = 'О';
        break;
    else
        %fprintf('Удалил символ %d\n', UpStr(2));
        UpStr = [UpStr(1) UpStr(3:end)];
    end
end

%fprintf('Второй символ - буква: %s\n', Ustr2);

% Recognition 3-rd, 4-th and 5-th numbers (VALUE)
NumPos = 3;

while NumPos <= 5
    
    if UpStr(NumPos) > 9
        %fprintf('Удалил символ %d\n', UpStr(NumPos));
        UpStr = [UpStr(1:NumPos-1) UpStr(NumPos+1:end)];
    else
        NumPos = NumPos + 1;
    end
end

Ustr3 = UpStr(3); %fprintf('Третий символ - цифра: %d\n', Ustr3);
Ustr4 = UpStr(4); %fprintf('Четвертый символ - цифра: %d\n', Ustr4);
Ustr5 = UpStr(5); %fprintf('Пятый символ - цифра: %d\n', Ustr5);

% Delete error regions
if Ustr5 == 0
    %fprintf('Удалил символ %d\n', UpStr(6));
    UpStr = [UpStr(1:5) UpStr(7:end)];
elseif Ustr5 == 6
    %fprintf('Удалил символ %d\n', UpStr(6));
    UpStr = [UpStr(1:5) UpStr(7:end)];
elseif Ustr5 == 8
    %fprintf('Удалил символы %d, %d\n', UpStr(6), UpStr(7));
    UpStr = [UpStr(1:5) UpStr(8:end)];
elseif Ustr5 == 9
    %fprintf('Удалил символ %d\n', UpStr(6));
    UpStr = [UpStr(1:5) UpStr(7:end)];
end

% Recognition 6-th number (POWER SIGN)
if (UpStr(6) == 12)
    Ustr6 = '-';
else
    Ustr6 = '+';
end

%fprintf('Знак степени: %s\n', Ustr6);
   
% Recognirion 7-th number (POWER)
while true
    if (strcmp(Ustr6, '-'))
        if UpStr(7) < 9
            Ustr7 = UpStr(7);
            break;
        else
            %fprintf('Удалил символ %d\n', UpStr(7));
            UpStr = [UpStr(1:6) UpStr(8:end)];
        end
    end
    
    if (strcmp(Ustr6, '+'))
        if UpStr(6) < 9
            Ustr7 = UpStr(6);
            break;
        else
            %fprintf('Удалил символ %d\n', UpStr(6));
            UpStr = [UpStr(1:5) UpStr(7:end)];
        end
    end
end

%fprintf('Степень: %d\n', Ustr7);

% Compare regions with numbers and return symbol value
function [num] = NumRecognize(Region)
    
    picpath = 'd:\! RESURS_SOFT\Worksourses\letters\';
    korr_max = 0;
    reg_num = 0;

    for i=0:1:12

       if i < 10 
           RefImg = strcat(picpath, num2str(i), '.png');
       elseif i == 10
           RefImg = strcat(picpath, 'Р.png');
       elseif i == 11
           RefImg = strcat(picpath, 'С.png');
       elseif i == 12
           RefImg = strcat(picpath, '-.png');
%        elseif i == 13
%            RefImg = 'letters\bred.png';
%        elseif i == 14
%            RefImg = 'letters\bred2.png';
       end

       k = GetCORRFun(Region, im2bw(imread(RefImg)));

       if k > korr_max
           korr_max = k;
           reg_num = i;
       end

    end
    
    num = reg_num;

% Get correlation function between region and reference image
function [k_korr] = GetCORRFun(reg, img)
    k_korr = corr2(reg, imresize(img, size(reg)));

% Some interest image processing
function [Im] = ImagePrew(I)
global ax_proc_img;
global ax_bw_img;

global AdImLow; global AdImHigh; global AdImGamma;
global MedfiltM; global MedfiltN;
global ImbinLevel;

I = imadjust(I, [AdImLow AdImHigh]/255, [ ], AdImGamma);

image(ax_proc_img, I);
set(ax_proc_img, 'Visible', 'off');         % Set axis unseeable (default)

I = rgb2gray(I);                            % Convert RGB image to GRAY
I = medfilt2(I, [MedfiltM MedfiltN]);
Im = im2bw(I, ImbinLevel/255);

image(ax_bw_img, ~Im);
colormap(ax_bw_img, gray(2));
set(ax_bw_img, 'Visible', 'Off');           % Set axis unseeable (default)
% -------------------------------------------------------------------------------------

% ----------------------------- Work with Shot Counter --------------------------------
% -------------------------------------------------------------------------------------

function btn_check_dir_Callback(hObject, eventdata, handles)

global path_SC

path_SC = uigetdir('d:\', 'Выберите папку с файлами LabMax');

    if path_SC ~= 0
        set(handles.btn_check_dir, 'BackgroundColor', 'g')
        set(handles.btn_check_dir, 'String', 'Выбрано')
        set(handles.lbl_dir_path, 'String', path_SC)
        set(handles.lbl_dir_path, 'BackgroundColor', [0.94 0.94 0.94])
        set(handles.lbl_dir_path, 'ForegroundColor', 'b')
        set(handles.btn_resource, 'Enable', 'on')
        set(handles.btn_plot, 'Enable', 'off')
        set(handles.lbl_resourceS, 'String', ' ');
        set(handles.lbl_XL_resurs, 'String', ' ');
        set(handles.lbl_razn, 'String', ' ');

    else
        set(handles.btn_check_dir, 'BackgroundColor', 'r')
        set(handles.btn_check_dir, 'String', 'Не выбрано')
        set(handles.lbl_dir_path, 'BackgroundColor', 'r')
        set(handles.lbl_dir_path, 'String', 'Выберите папку с файлами LabMax')
        set(handles.btn_resource, 'Enable', 'off')
        set(handles.btn_plot, 'Enable', 'off')
        set(handles.lbl_resourceS, 'String', ' ');
        set(handles.lbl_XL_resurs, 'String', ' ');
        set(handles.lbl_razn, 'String', ' ');
    end

function btn_resource_Callback(hObject, eventdata, handles)

set(handles.btn_resource, 'Enable', 'off')

global path_SC;
global srt_search;
global csvF;
global index;
global allShots;

csvF = cell(300,1);
index = 1;
allShots = [];
srt_search = get(handles.search_txt, 'String');

GetCSVFiles(path_SC);

for i=1:1:index-1
    n = char(csvF(i));
    fShotCounter(n);
end

recourceXL = ResourseFromXL;

format long

set(handles.lbl_index, 'String', index-1);
set(handles.lbl_resourceS, 'String', sprintf('%d', length(allShots)));
set(handles.lbl_XL_resurs, 'String', sprintf('%d', recourceXL));
set(handles.lbl_razn, 'String', sprintf('%d', length(allShots)-recourceXL));

set(handles.btn_resource, 'Enable', 'on')
set(handles.btn_plot, 'Enable', 'on')

function btn_plot_Callback(hObject, eventdata, handles)

global allShots

format long
x = 1:1:length(allShots);

a = [5378000 5378000 9250000 9250000];
b = [min(allShots)*1e3-0.9 max(allShots)*1e3+0.9 max(allShots)*1e3+0.9 min(allShots)*1e3-0.9];

text_x = ((9250000-5378000)/(2e6))+(5378000/1e6);
text_y = max(allShots)*1e3 - 1;


h1 = figure;
ax1 = axes(h1);

set(h1,'Color', 'white');
set(ax1, 'FontSize', 12);

hold on;

%fill(ax1, a/1e6, b, 'c')
plot(ax1, x/1e6, allShots*1e3, '-r', 'LineWidth', 1);

set(ax1, 'YLim', [min(allShots)*1e3-1 max(allShots)*1e3+1]);

xlabel('Pulses, millions', 'FontSize', 15, 'Color', 'black');
ylabel ('Energy, mJ', 'FontSize', 15, 'Color', 'blue');
%text(ax1, text_x, text_y, 'Воздух', 'HorizontalAlignment', 'center');
grid on;

hold off;

function GetCSVFiles (put)

global srt_search
global csvF
global index

mass_path = dir(put);

    for i=1:1:length(mass_path)
        
        str_name = mass_path(i).name;
        full_path = strcat(mass_path(i).folder, '\', str_name);
        
        if mass_path(i).isdir & strncmp(srt_search, str_name, 6)
            
            GetCSVFiles(full_path)
            
        elseif length(findstr('csv',str_name)) > 0
            
            t = dir(full_path);
            
            if t.bytes > 100
                csvF{index} = full_path;
                index = index + 1;
            end
        
        end
   
    end
    
    
function fShotCounter (file)

global allShots

M = csvread(file, 3, 0);
M = M(:,2)';
allShots = [allShots M];

% --- Executes on button press in check_search.
function check_search_Callback(hObject, eventdata, handles)

global path_SC

if get(handles.check_search, 'Value') & path_SC ~= 0
    set(handles.btn_resource, 'Enable', 'on');
    set(handles.search_txt, 'Enable', 'off');
    
elseif get(handles.check_search, 'Value')
    set(handles.search_txt, 'Enable', 'off');
    
else
    set(handles.btn_resource, 'Enable', 'off');
    set(handles.btn_plot, 'Enable', 'off');
    set(handles.search_txt, 'Enable', 'on');
end

function resource = ResourseFromXL

fid = fopen('d:\! RESURS_2018\Resource.txt');
while ~feof(fid) 
    resource = str2double(fgetl(fid)); 
end 
fclose(fid); 
% -------------------------------------------------------------------------------------
% -------------------------------------------------------------------------------------
