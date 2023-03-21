###
# wxRuby3 wxWidgets interface generation specs
# Copyright (c) M.J.N. Corino, The Netherlands
###

module WXRuby3

  Director.Package('Wx') { |pkg|
    Director.Spec(pkg, 'wxDefs')
    Director.Spec(pkg, 'wxFunctions')
    Director.Spec(pkg, 'wxGDICommon')
    Director.Spec(pkg, 'wxColour')
    Director.Spec(pkg, 'wxObject')
    Director.Spec(pkg, 'wxKeyboardState')
    Director.Spec(pkg, 'wxMouseState')
    Director.Spec(pkg, 'wxEvent')
    Director.Spec(pkg, 'wxEvtHandler')
    Director.Spec(pkg, 'wxEvents')
    Director.Spec(pkg, 'wxApp')
    Director.Spec(pkg, 'wxDC')
    Director.Spec(pkg, 'wxWindowDC', director: Director::DerivedDC)
    Director.Spec(pkg, 'wxClientDC', director: Director::DerivedDC)
    Director.Spec(pkg, 'wxPaintDC', director: Director::DerivedDC)
    Director.Spec(pkg, 'wxMemoryDC', director: Director::DerivedDC)
    Director.Spec(pkg, 'wxBufferedDC', director: Director::DerivedDC)
    Director.Spec(pkg, 'wxBufferedPaintDC', director: Director::DerivedDC)
    Director.Spec(pkg, 'wxAutoBufferedPaintDC', director: Director::DerivedDC)
    Director.Spec(pkg, 'wxMirrorDC', director: Director::DerivedDC)
    Director.Spec(pkg, 'wxWindow')
    Director.Spec(pkg, 'wxNonOwnedWindow', director: Director::Window)
    Director.Spec(pkg, 'wxPopupWindow')
    Director.Spec(pkg, 'wxTopLevelWindow')
    Director.Spec(pkg, 'wxFrame')
    Director.Spec(pkg, 'wxMiniFrame', director: Director::Frame)
    Director.Spec(pkg, 'wxGDIObject')
    Director.Spec(pkg, 'wxGraphicsObject')
    Director.Spec(pkg, 'wxGraphicsContext')
    Director.Spec(pkg, 'wxBrush')
    Director.Spec(pkg, 'wxPen')
    Director.Spec(pkg, 'wxPalette')
    Director.Spec(pkg, 'wxRegion')
    Director.Spec(pkg, 'wxIconLocation')
    Director.Spec(pkg, 'wxBitmap')
    Director.Spec(pkg, 'wxIcon')
    Director.Spec(pkg, 'wxCaret')
    Director.Spec(pkg, 'wxValidator')
    Director.Spec(pkg, 'wxTextValidator')
    Director.Spec(pkg, 'wxAccelerator')
    Director.Spec(pkg, 'wxMenuItem')
    Director.Spec(pkg, 'wxMenuBar')
    Director.Spec(pkg, 'wxMenu')
    Director.Spec(pkg, 'wxAboutDialogInfo')
    Director.Spec(pkg, 'wxDialog')
    Director.Spec(pkg, 'wxMessageDialog', director: Director::Dialog)
    Director.Spec(pkg, 'wxSizerItem')
    Director.Spec(pkg, 'wxSizer')
    Director.Spec(pkg, 'wxBoxSizer', director: Director::Sizer)
    Director.Spec(pkg, 'wxControl')
    Director.Spec(pkg, 'wxStatusBar', requirements: %w[wxUSE_STATUSBAR])
    Director.Spec(pkg, 'wxTextEntry')
    Director.Spec(pkg, 'wxTextAttr')
    Director.Spec(pkg, 'wxTextCtrl')
    Director.Spec(pkg, 'wxCheckBox', director: Director::Window)
    Director.Spec(pkg, 'wxAnyButton', director: Director::Window)
    Director.Spec(pkg, 'wxButton')
    Director.Spec(pkg, 'wxToggleButton')
    Director.Spec(pkg, 'wxControlWithItems')
    Director.Spec(pkg, 'wxComboBox')
    Director.Spec(pkg, 'wxRadioBox')
    Director.Spec(pkg, 'wxPanel')
    Director.Spec(pkg, 'wxWithImages')
    Director.Spec(pkg, 'wxBookCtrlEvent', director: Director::Event, requirements: Director.AnyOf(*%w[wxUSE_AUI wxUSE_NOTEBOOK wxUSE_LISTBOOK wxUSE_CHOICEBOOK wxUSE_TOOLBOOK wxUSE_TREEBOOK]))
    Director.Spec(pkg, 'wxBookCtrlBase', director: Director::BookCtrls, requirements: Director.AnyOf(*%w[wxUSE_AUI wxUSE_NOTEBOOK wxUSE_LISTBOOK wxUSE_CHOICEBOOK wxUSE_TOOLBOOK wxUSE_TREEBOOK]))
    Director.Spec(pkg, 'wxNotebook', director: Director::BookCtrls, requirements: Director.AnyOf(*%w[wxUSE_AUI wxUSE_NOTEBOOK wxUSE_LISTBOOK wxUSE_CHOICEBOOK wxUSE_TOOLBOOK wxUSE_TREEBOOK]))
    Director.Spec(pkg, 'wxImageList')
    Director.Spec(pkg, 'wxListBox')
    Director.Spec(pkg, 'wxChoice')
    Director.Spec(pkg, 'wxStaticBox', director: Director::Window)
    Director.Spec(pkg, 'wxCollapsiblePane', director: Director::Window, requirements: %w[wxUSE_COLLPANE])
    Director.Spec(pkg, 'wxCollapsiblePaneEvent', requirements: %w[wxUSE_COLLPANE])
    Director.Spec(pkg, 'wxStaticLine', director: Director::Window)
    Director.Spec(pkg, 'wxGauge', director: Director::Window)
    Director.Spec(pkg, 'wxSlider', director: Director::Window)
    Director.Spec(pkg, 'wxStaticText', director: Director::Window)
    Director.Spec(pkg, 'wxSpinButton', director: Director::Window, requirements: %w[wxUSE_SPINBTN])
    Director.Spec(pkg, 'wxSpinEvent', director: Director::Event, requirements: Director.AnyOf(*%w[wxUSE_SPINBTN wxUSE_SPINCTRL]))
    Director.Spec(pkg, 'wxSpinCtrl', director: Director::Window, requirements: %w[wxUSE_SPINCTRL])
    Director.Spec(pkg, 'wxStaticBitmap')
    Director.Spec(pkg, 'wxBitmapButton', director: Director::Button)
    Director.Spec(pkg, 'wxArtProvider')
    Director.Spec(pkg, 'wxStaticBoxSizer', director: Director::Sizer)
    Director.Spec(pkg, 'wxStdDialogButtonSizer', director: Director::Sizer)
    Director.Spec(pkg, 'wxCursor')
    Director.Spec(pkg, 'wxRadioButton', director: Director::Window)
    Director.Spec(pkg, 'wxToolTip')
    Director.Spec(pkg, 'wxLog')
    Director.Spec(pkg, 'wxToolBar', requirements: %w[wxUSE_TOOLBAR])
    Director.Spec(pkg, 'wxImage')
    Director.Spec(pkg, 'wxDragImage')
    Director.Spec(pkg, 'wxFont')
    Director.Spec(pkg, 'wxFontData', requirements: %w[wxUSE_FONTDLG])
    Director.Spec(pkg, 'wxFontDialog', director: Director::Dialog, requirements: %w[wxUSE_FONTDLG])
    Director.Spec(pkg, 'wxPickerBase')
    Director.Spec(pkg, 'wxFontPickerEvent', director: Director::Event, requirements: %w[wxUSE_FONTDLG wxUSE_FONTPICKERCTRL])
    Director.Spec(pkg, 'wxFontPickerCtrl', requirements: %w[wxUSE_FONTDLG wxUSE_FONTPICKERCTRL])
    Director.Spec(pkg, 'wxLocale')
    Director.Spec(pkg, 'wxSystemSettings')
    Director.Spec(pkg, 'wxSystemOptions')
    Director.Spec(pkg, 'wxPropertySheetDialog', director: Director::Dialog)
    Director.Spec(pkg, 'wxScrolledWindow', director: Director::ScrolledT)
    Director.Spec(pkg, 'wxScrolledCanvas', director: Director::ScrolledT)
    Director.Spec(pkg, 'wxScrolledControl', director: Director::ScrolledT)
    Director.Spec(pkg, 'wxFindReplaceData', requirements: %w[wxUSE_FINDREPLDLG])
    Director.Spec(pkg, 'wxFindReplaceDialog', director: Director::Dialog, requirements: %w[wxUSE_FINDREPLDLG])
    Director.Spec(pkg, 'wxFindDialogEvent', requirements: %w[wxUSE_FINDREPLDLG])
    Director.Spec(pkg, 'wxToolbook', director: Director::BookCtrls, requirements: Director.AnyOf(%w[wxUSE_AUI wxUSE_NOTEBOOK wxUSE_LISTBOOK wxUSE_CHOICEBOOK wxUSE_TOOLBOOK wxUSE_TREEBOOK]))
    Director.Spec(pkg, 'wxColourData', requirements: %w[wxUSE_COLOURDLG])
    Director.Spec(pkg, 'wxColourDialog', director: Director::Dialog, requirements: %w[wxUSE_COLOURDLG])
    Director.Spec(pkg, 'wxColourPickerEvent', director: Director::Event, requirements: %w[wxUSE_COLOURPICKERCTRL wxUSE_COLOURDLG])
    Director.Spec(pkg, 'wxColourPickerCtrl', requirements: %w[wxUSE_COLOURPICKERCTRL wxUSE_COLOURDLG])
    Director.Spec(pkg, 'wxTextEntryDialog', director: Director::Dialog)
    Director.Spec(pkg, 'wxNumberEntryDialog', director: Director::Dialog)
    Director.Spec(pkg, 'wxSingleChoiceDialog', director: Director::Dialog)
    Director.Spec(pkg, 'wxMultiChoiceDialog', director: Director::Dialog)
    Director.Spec(pkg, 'wxTipProvider')
    Director.Spec(pkg, 'wxDirDialog', director: Director::Dialog, requirements: %w[wxUSE_DIRDLG])
    Director.Spec(pkg, 'wxFileDialog', director: Director::Dialog, requirements: %w[wxUSE_FILEDLG])
    Director.Spec(pkg, 'wxFileDirPickerEvent', director: Director::Event, requirements: Director.AnyOf(%w[wxUSE_DIRDLG wxUSE_DIRPICKERCTRL], %w[wxUSE_FILEDLG wxUSE_FILEPICKERCTRL]))
    Director.Spec(pkg, 'wxDirPickerCtrl', requirements: %w[wxUSE_DIRDLG wxUSE_DIRPICKERCTRL])
    Director.Spec(pkg, 'wxFilePickerCtrl', requirements: %w[wxUSE_FILEDLG wxUSE_FILEPICKERCTRL])
    Director.Spec(pkg, 'wxProgressDialog', director: Director::Dialog)
    Director.Spec(pkg, 'wxWindowDisabler')
    Director.Spec(pkg, 'wxBusyInfo', requirements: %w[wxUSE_BUSYINFO])
    Director.Spec(pkg, 'wxListCtrl', requirements: %w[wxUSE_LISTCTRL])
    Director.Spec(pkg, 'wxListEvent', director: Director::Event, requirements: %w[wxUSE_LISTCTRL])
    Director.Spec(pkg, 'wxGridSizer', director: Director::Sizer)
    Director.Spec(pkg, 'wxFlexGridSizer', director: Director::Sizer)
    Director.Spec(pkg, 'wxGBSizerItem', director: Director::SizerItem)
    Director.Spec(pkg, 'wxGridBagSizer', director: Director::Sizer)
    Director.Spec(pkg, 'wxSplitterEvent', requirements: %w[wxUSE_SPLITTER])
    Director.Spec(pkg, 'wxSplitterWindow', requirements: %w[wxUSE_SPLITTER])
    Director.Spec(pkg, 'wxTreeEvent', requirements: %w[wxUSE_TREECTRL])
    Director.Spec(pkg, 'wxTreeCtrl', requirements: %w[wxUSE_TREECTRL])
    Director.Spec(pkg, 'wxDateEvent', requirements: %w[wxUSE_DATETIME])
    Director.Spec(pkg, 'wxCalendarEvent', director: Director::DateEvent, requirements: %w[wxUSE_CALENDARCTRL])
    Director.Spec(pkg, 'wxCalendarDateAttr', requirements: %w[wxUSE_CALENDARCTRL])
    Director.Spec(pkg, 'wxCalendarCtrl', requirements: %w[wxUSE_CALENDARCTRL])
    Director.Spec(pkg, 'wxDatePickerCtrl', requirements: %w[wxUSE_DATEPICKCTRL])
    Director.Spec(pkg, 'wxTimerEvent', director: Director::Event, requirements: %w[wxUSE_TIMER])
    Director.Spec(pkg, 'wxTimer', requirements: %w[wxUSE_TIMER])
    Director.Spec(pkg, 'wxSashEvent', director: Director::Event, requirements: %w[wxUSE_SASH])
    Director.Spec(pkg, 'wxSashWindow', requirements: %w[wxUSE_SASH])
    Director.Spec(pkg, 'wxSashLayoutWindow', requirements: %w[wxUSE_SASH])
    Director.Spec(pkg, 'wxQueryLayoutInfoEvent', director: Director::SashLayoutEvent)
    Director.Spec(pkg, 'wxCalculateLayoutEvent', director: Director::SashLayoutEvent)
    Director.Spec(pkg, 'wxEditableListBox')
    Director.Spec(pkg, 'wxWizardEvent', director: Director::Event, requirements: %w[wxUSE_WIZARDDLG])
    Director.Spec(pkg, 'wxWizardPage', requirements: %w[wxUSE_WIZARDDLG])
    Director.Spec(pkg, 'wxWizardPageSimple', director: Director::WizardPage, requirements: %w[wxUSE_WIZARDDLG])
    Director.Spec(pkg, 'wxWizard', director: Director::Dialog, requirements: %w[wxUSE_WIZARDDLG])
    Director.Spec(pkg, 'wxCheckListBox', requirements: %w[wxUSE_CHECKLISTBOX])
    Director.Spec(pkg, 'wxDataFormat', requirements: %w[wxUSE_CLIPBOARD])
    Director.Spec(pkg, 'wxDataObject', requirements: %w[wxUSE_CLIPBOARD])
    Director.Spec(pkg, 'wxClipboard', requirements: %w[wxUSE_CLIPBOARD])
    Director.Spec(pkg, 'wxDragDrop', requirements: %w[wxUSE_DRAG_AND_DROP])
    Director.Spec(pkg, 'wxContextHelpButton', director: Director::Button, requirements: %w[wxUSE_HELP])
    Director.Spec(pkg, 'wxHelpProvider', requirements: %w[wxUSE_HELP])
    Director.Spec(pkg, 'wxHelpController', requirements: %w[wxUSE_HELP])
    Director.Spec(pkg, 'wxTaskBarIconEvent', director: Director::Event, requirements: %w[wxUSE_TASKBARICON])
    Director.Spec(pkg, 'wxTaskBarIcon', requirements: %w[wxUSE_TASKBARICON])
    Director.Spec(pkg, 'wxFSFile', requirements: %[wxUSE_FILESYSTEM])
    Director.Spec(pkg, 'wxUtils')
    Director.Spec(pkg, 'wxDirFilterListCtrl')
    Director.Spec(pkg, 'wxGenericDirCtrl')
    Director.Spec(pkg, 'wxMDIClientWindow', director: Director::Window, requirements: %w[wxUSE_MDI])
    Director.Spec(pkg, 'wxMDIFrame', requirements: %w[wxUSE_MDI])
    Director.Spec(pkg, 'wxAccessible', requirements: %w[wxUSE_ACCESSIBILITY])
    Director.Spec(pkg, 'wxAnimation', requirements: %w[wxUSE_ANIMATIONCTRL])
    Director.Spec(pkg, 'wxAnimationCtrl', requirements: %w[wxUSE_ANIMATIONCTRL])
    Director.Spec(pkg, 'wxMediaEvent', director: Director::Event, requirements: %w[wxUSE_MEDIACTRL])
    Director.Spec(pkg, 'wxMediaCtrl', requirements: %w[wxUSE_MEDIACTRL])
    Director.Spec(pkg, 'wxXmlNode', requirements: %w[wxUSE_XML])
    Director.Spec(pkg, 'wxXmlResource', requirements: %w[wxUSE_XRC])
    Director.Spec(pkg, 'wxVariant', requirements: %w[wxUSE_VARIANT])
    Director.Spec(pkg, 'wxPlatformInfo')
  }

  Director.Package('Wx::PRT', 'wxUSE_PRINTING_ARCHITECTURE') do |pkg|
    Director.Spec(pkg, 'wxPrinterDC', director: Director::DerivedDC)
    Director.Spec(pkg, 'wxPostScriptDC', director: Director::DerivedDC)
    Director.Spec(pkg, 'wxPrintData')
    Director.Spec(pkg, 'wxPrintDialog')
    Director.Spec(pkg, 'wxPrintAbortDialog', director: Director::Dialog)
    Director.Spec(pkg, 'wxPageSetupDialog')
    Director.Spec(pkg, 'wxPreviewFrame')
    Director.Spec(pkg, 'wxPrinter')
  end

  Director.Package('Wx::RTC', 'wxUSE_RICHTEXT') { |pkg|
    Director.Spec(pkg, 'wxRichTextEvent')
    Director.Spec(pkg, 'wxRichTextBuffer')
    Director.Spec(pkg, 'wxRichTextCtrl')
    Director.Spec(pkg, 'wxRichTextFileHandler')
    Director.Spec(pkg, 'wxRichTextXMLHandler', director: Director::RichTextFileHandler)
    Director.Spec(pkg, 'wxRichTextHTMLHandler', director: Director::RichTextFileHandler)
    Director.Spec(pkg, 'wxRichTextHeaderFooterData', requirements: %w[wxUSE_PRINTING_ARCHITECTURE])
    Director.Spec(pkg, 'wxRichTextPrinting', requirements: %w[wxUSE_PRINTING_ARCHITECTURE])
    Director.Spec(pkg, 'wxSymbolPickerDialog', director: Director::Dialog)
  }

  Director.Package('Wx::STC', 'wxUSE_STC') { |pkg|
    Director.Spec(pkg, 'wxStyledTextEvent', director: Director::Event)
    Director.Spec(pkg, 'wxStyledTextCtrl')
  }

  Director.Package('Wx::GRID', 'wxUSE_GRID') { |pkg|
    Director.Spec(pkg, 'wxGridEvent', director: Director::Event)
    Director.Spec(pkg, 'wxGridSizeEvent', director: Director::Event)
    Director.Spec(pkg, 'wxGridEditorCreatedEvent', director: Director::Event)
    Director.Spec(pkg, 'wxGridRangeSelectEvent')
    Director.Spec(pkg, 'wxGridTableBase')
    Director.Spec(pkg, 'wxGridCellAttr')
    Director.Spec(pkg, 'wxGridCellEditor')
    Director.Spec(pkg, 'wxGridCellRenderer')
    Director.Spec(pkg, 'wxGridCellActivatableEditor', director: Director::GridCellEditor)
    Director.Spec(pkg, 'wxGridCellBoolEditor', director: Director::GridCellEditor)
    Director.Spec(pkg, 'wxGridCellChoiceEditor', director: Director::GridCellEditor)
    Director.Spec(pkg, 'wxGridCellEnumEditor', director: Director::GridCellEditor)
    Director.Spec(pkg, 'wxGridCellDateEditor', director: Director::GridCellEditor)
    Director.Spec(pkg, 'wxGridCellTextEditor', director: Director::GridCellEditor)
    Director.Spec(pkg, 'wxGridCellFloatEditor', director: Director::GridCellEditor)
    Director.Spec(pkg, 'wxGridCellNumberEditor', director: Director::GridCellEditor)
    Director.Spec(pkg, 'wxGridCellAutoWrapStringEditor', director: Director::GridCellEditor)
    Director.Spec(pkg, 'wxGridCellBoolRenderer', director: Director::GridCellRenderer)
    Director.Spec(pkg, 'wxGridCellStringRenderer', director: Director::GridCellRenderer)
    Director.Spec(pkg, 'wxGridCellFloatRenderer', director: Director::GridCellRenderer)
    Director.Spec(pkg, 'wxGridCellAutoWrapStringRenderer', director: Director::GridCellRenderer)
    Director.Spec(pkg, 'wxGridCellDateRenderer', director: Director::GridCellRenderer)
    Director.Spec(pkg, 'wxGridCellDateTimeRenderer', director: Director::GridCellRenderer)
    Director.Spec(pkg, 'wxGridCellEnumRenderer', director: Director::GridCellRenderer)
    Director.Spec(pkg, 'wxGridCellNumberRenderer', director: Director::GridCellRenderer)
    Director.Spec(pkg, 'wxGridTableMessage')
    Director.Spec(pkg, 'wxGridStringTable')
    Director.Spec(pkg, 'wxGridCtrl')
  }

  Director.Package('Wx::HTML', 'wxUSE_HTML') { |pkg|
    Director.Spec(pkg, 'wxHtmlWindow')
    Director.Spec(pkg, 'wxHtmlHelpData')
    Director.Spec(pkg, 'wxHtmlHelpWindow', director: Director::Window)
    Director.Spec(pkg, 'wxHtmlHelpFrame')
    Director.Spec(pkg, 'wxHtmlCellEvent', director: Director::HtmlEvent)
    Director.Spec(pkg, 'wxHtmlLinkEvent', director: Director::HtmlEvent)
    Director.Spec(pkg, 'wxHtmlHelpController', director: Director::HelpController, requirements: %w[wxUSE_HELP])
    Director.Spec(pkg, 'wxHtmlCell')
    Director.Spec(pkg, 'wxHtmlEasyPrinting', requirements: %w[wxUSE_PRINTING_ARCHITECTURE])
    Director.Spec(pkg, 'wxHtmlPrintout', requirements: %w[wxUSE_PRINTING_ARCHITECTURE])
  }

  Director.Package('Wx::AUI', 'wxUSE_AUI') { |pkg|
    Director.Spec(pkg, 'wxAuiPaneInfo')
    Director.Spec(pkg, 'wxAuiManagerEvent')
    Director.Spec(pkg, 'wxAuiDockArt')
    Director.Spec(pkg, 'wxAuiFloatingFrame')
    Director.Spec(pkg, 'wxAuiManager')
    Director.Spec(pkg, 'wxAuiNotebookEvent')
    Director.Spec(pkg, 'wxAuiTabArt')
    Director.Spec(pkg, 'wxAuiNotebook')
    Director.Spec(pkg, 'wxAuiTabCtrl')
    Director.Spec(pkg, 'wxAuiToolBarItem')
    Director.Spec(pkg, 'wxAuiToolBarArt')
    Director.Spec(pkg, 'wxAuiToolBarEvent')
    Director.Spec(pkg, 'wxAuiToolBar')
    Director.Spec(pkg, 'wxAuiMDIClientWindow')
    Director.Spec(pkg, 'wxAuiMDIParentFrame')
    Director.Spec(pkg, 'wxAuiMDIChildFrame')
  }

  Director.Package('Wx::PG', 'wxUSE_PROPGRID') { |pkg|
    Director.Spec(pkg, 'wxPGEditor')
    Director.Spec(pkg, 'wxPGMultiButton')
    Director.Spec(pkg, 'wxPGCell')
    Director.Spec(pkg, 'wxPGProperty')
    Director.Spec(pkg, 'wxNumericPropertyValidator')
    Director.Spec(pkg, 'wxPGArrayEditorDialog')
    Director.Spec(pkg, 'wxPGProperties')
    Director.Spec(pkg, 'wxPropertyGridEvent')
    Director.Spec(pkg, 'wxPGValidationInfo')
    Director.Spec(pkg, 'wxPropertyGridPageState')
    Director.Spec(pkg, 'wxPropertyGridPage')
    Director.Spec(pkg, 'wxPropertyGridInterface')
    Director.Spec(pkg, 'wxPropertyGrid')
    Director.Spec(pkg, 'wxPropertyGridManager')
  }

  Director.Package('Wx::RBN', 'wxUSE_RIBBON') { |pkg|
    Director.Spec(pkg, 'wxRibbonBarEvent')
    Director.Spec(pkg, 'wxRibbonButtonBarEvent')
    Director.Spec(pkg, 'wxRibbonGalleryEvent')
    Director.Spec(pkg, 'wxRibbonPanelEvent')
    Director.Spec(pkg, 'wxRibbonToolBarEvent')
    Director.Spec(pkg, 'wxRibbonArtProvider')
    Director.Spec(pkg, 'wxRibbonControl')
    Director.Spec(pkg, 'wxRibbonBar')
    Director.Spec(pkg, 'wxRibbonGallery')
    Director.Spec(pkg, 'wxRibbonPage')
    Director.Spec(pkg, 'wxRibbonPanel')
    Director.Spec(pkg, 'wxRibbonToolBar')
    Director.Spec(pkg, 'wxRibbonButtonBar')
  }
end # module WXRuby3