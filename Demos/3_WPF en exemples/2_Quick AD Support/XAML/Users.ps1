[System.Reflection.Assembly]::LoadWithPartialName('presentationframework') 				| out-null
[System.Reflection.Assembly]::LoadFrom('assembly\MahApps.Metro.dll')       				| out-null

function LoadXml ($global:filename)
{
    $XamlLoader=(New-Object System.Xml.XmlDocument)
    $XamlLoader.Load($filename)
    return $XamlLoader
}

# Load MainWindow
$XamlMainWindow=LoadXml("Users.xaml")
$Reader=(New-Object System.Xml.XmlNodeReader $XamlMainWindow)
$Users_Window=[Windows.Markup.XamlReader]::Load($Reader)

$Global:Current_Folder =(get-location).path 

# Selection Part
$Expander_Selection_Block = $Users_Window.findname("Expander_Selection_Block") 
$Expander_Selection = $Users_Window.findname("Expander_Selection") 
$User_TxtBox = $Users_Window.findname("User_TxtBox") 
$Check_User_btn = $Users_Window.findname("Check_User_btn") 
$User_Block_OK = $Users_Window.findname("User_Block_OK") 
$User_Block_KO = $Users_Window.findname("User_Block_KO") 
$user_OK = $Users_Window.findname("Expander_More") 
$user_KO = $Users_Window.findname("Expander_More") 

# Warning
$Global_Warning_Block = $Users_Window.findname("Global_Warning_Block") 
$Expander_Warning = $Users_Window.findname("Expander_Warning") 
$Warning_Label = $Users_Window.findname("Warning_Label") 
$DatagGrid_MultiUsers = $Users_Window.findname("DatagGrid_MultiUsers") 
$DatagGrid_Users = $Users_Window.findname("DatagGrid_Users") 


# Basic infos block
$Expander_Basic_Block = $Users_Window.findname("Expander_Basic_Block") 
$Expander_Basic = $Users_Window.findname("Expander_Basic") 
$IsEnabled_Value = $Users_Window.findname("IsEnabled_Value") 
$Locked_Value = $Users_Window.findname("Locked_Value") 
$IsPWDExpired_Value = $Users_Window.findname("IsPWDExpired_Value") 
$DisplayName_Value = $Users_Window.findname("DisplayName_Value") 
$Account_Value = $Users_Window.findname("Account_Value") 
$PWDLastChange_Value = $Users_Window.findname("PWDLastChange_Value") 
$PWD_Expiration_Date_Value = $Users_Window.findname("PWD_Expiration_Date_Value") 
$LastLogOn_Value = $Users_Window.findname("LastLogOn_Value") 
$UserOU_Value = $Users_Window.findname("UserOU_Value") 


# More infos block
$Expander_More_Block = $Users_Window.findname("Expander_More_Block") 
$Expander_More = $Users_Window.findname("Expander_More") 
$Dept_Value = $Users_Window.findname("Dept_Value") 
$Mail_Value = $Users_Window.findname("Mail_Value") 
$Office_Value = $Users_Window.findname("Office_Value") 
$LastBadPWD_Value = $Users_Window.findname("LastBadPWD_Value") 
$WhenCreated_Value = $Users_Window.findname("WhenCreated_Value") 
$WhenChanged_Value = $Users_Window.findname("WhenChanged_Value") 
$CannotChangePassword_Value = $Users_Window.findname("CannotChangePassword_Value") 
$PWDNeverExpires_Value = $Users_Window.findname("PWDNeverExpires_Value") 


# More options action block
$Expander_More_options_Block = $Users_Window.findname("Expander_More_options_Block") 
$Expander_More_options = $Users_Window.findname("Expander_More_options") 
$Export_User_Values = $Users_Window.findname("Export_User_Values") 
$User_Unlock_Account = $Users_Window.findname("User_Unlock_Account") 
$Change_Password = $Users_Window.findname("Change_Password") 
$User_Display_Groups = $Users_Window.findname("User_Display_Groups") 
$Delete_User_Account = $Users_Window.findname("Delete_User_Account") 


# Group Membership block
$Expander_GroupMembership_Block = $Users_Window.findname("Expander_GroupMembership_Block") 
$Expander_GroupMembership = $Users_Window.findname("Expander_GroupMembership") 
$DatagGrid_Groups = $Users_Window.findname("DatagGrid_Groups") 


# Change password block
$Expander_Change_Password_Block = $Users_Window.findname("Expander_Change_Password_Block") 
$Expander_Change_Password = $Users_Window.findname("Expander_Change_Password") 
$First_Password = $Users_Window.findname("First_Password") 
$Confirm_Password = $Users_Window.findname("Confirm_Password") 
$Set_Password = $Users_Window.findname("Set_Password") 
$User_Enable_Account = $Users_Window.findname("User_Enable_Account") 


# Block initialization
$Expander_Change_Password_Block.Visibility = "Collapsed"
$Expander_GroupMembership_Block.Visibility = "Collapsed"
$Expander_Selection_Block.Visibility = "Visible"
$Global_Warning_Block.Visibility = "Collapsed"
$User_Block_OK.Visibility = "Collapsed"
$User_Block_KO.Visibility = "Collapsed"


# Expander initialization
$Expander_GroupMembership.IsExpanded = $false
$Expander_Selection.IsExpanded = $True



$Users_Window.ShowDialog()
