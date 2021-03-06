[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')  				| out-null
[System.Reflection.Assembly]::LoadWithPartialName('presentationframework') 				| out-null
[System.Reflection.Assembly]::LoadFrom('assembly\MahApps.Metro.dll')       				| out-null

function LoadXml ($global:filename)
{
    $XamlLoader=(New-Object System.Xml.XmlDocument)
    $XamlLoader.Load($filename)
    return $XamlLoader
}

$XamlMainWindow=LoadXml("PS1_WPF_TopMenu.xaml")

$Reader=(New-Object System.Xml.XmlNodeReader $XamlMainWindow)
$Form=[Windows.Markup.XamlReader]::Load($Reader)

$Mode_Sub1 = $Form.FindName("Mode_Sub1")
$Mode_Sub2 = $Form.FindName("Mode_Sub2")

$Add_btn = $Form.FindName("Add_btn")
$Modify_btn = $Form.FindName("Modify_btn")
$Remove_btn = $Form.FindName("Remove_btn")
$Refresh_btn = $Form.FindName("Refresh_btn")
$Tab_Info = $Form.FindName("Tab_Info")

$Mylabel = $Form.FindName("Mylabel")

$Mode_Sub1.Add_MouseEnter({		
	$Mylabel.Content = "SubMenu1"
})

$Mode_Sub2.Add_MouseEnter({		
	$Mylabel.Content = "SubMenu2"
})

$Add_btn.Add_MouseEnter({		
	$Mylabel.Content = "Add button"
})

$Modify_btn.Add_MouseEnter({		
	$Mylabel.Content = "Modify button"
})

$Remove_btn.Add_MouseEnter({		
	$Mylabel.Content = "Remove button"
})

$Refresh_btn.Add_MouseEnter({		
	$Mylabel.Content = "Refresh button"
})

$Tab_Info.Add_MouseEnter({		
	$Mylabel.Content = "Infos button"
})


$Form.ShowDialog() | Out-Null