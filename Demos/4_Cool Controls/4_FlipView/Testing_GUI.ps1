[System.Reflection.Assembly]::LoadFrom('Assembly\MahApps.Metro.dll')      
[System.Reflection.Assembly]::LoadFrom('Assembly\System.Windows.Interactivity.dll') 
[System.Reflection.Assembly]::LoadWithPartialName('presentationframework') | out-null

function LoadXml ($global:filename)
{
    $XamlLoader=(New-Object System.Xml.XmlDocument)
    $XamlLoader.Load($filename)
    return $XamlLoader
}

# Load MainWindow
$XamlMainWindow=LoadXml("Testing_GUI.xaml")
$Reader=(New-Object System.Xml.XmlNodeReader $XamlMainWindow)
$Form=[Windows.Markup.XamlReader]::Load($Reader)


$FlipView = $Form.findname("FlipView") 

$FlipView.Add_SelectionChanged({
	Switch ($FlipView.SelectedIndex) 
		{ 
			0 {   		
				$FlipView.BannerText = "Ma première image" 							
			}

			1 { 
				$FlipView.BannerText = "Ma seconde image" 							
			} 

		} 	
})	

$Form.ShowDialog() | Out-Null