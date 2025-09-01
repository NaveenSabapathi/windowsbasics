🖨️ USB Printer Network Share Fix (Windows 10/11)

This repository contains a simple batch file (.bat) that helps fix the common USB printer network sharing error:

Operation could not be completed (error 0x00000709)


This error usually occurs when trying to share a USB printer across a network on Windows 10 or Windows 11. The issue is primarily caused by Windows software policy restrictions on RPC.

✅ What This Fix Does

Creates the required Printer RPC policy in the Windows Registry.

Allows you to add and share USB printers over the network.

No manual registry editing needed — just run the script.

⚠️ Requirements

Windows 10 / Windows 11 (Home, Pro, or Enterprise).

Administrator privileges (must run as admin).

🚀 How to Use

Download the .bat file from this repository.

Right-click → Run as administrator.

The script will automatically configure the registry.

Restart your computer (recommended).

Try sharing your USB printer again — it should now work without error.

🔒 Notes

This script only modifies printer policy keys related to RPC; it does not affect any other system settings.

If you no longer need the changes, you can manually remove the registry keys created under:

HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Printers\RPC

📝 Disclaimer

This script is provided as-is without any warranty.
Always review scripts before running them, and make a registry backup if you want extra safety.
