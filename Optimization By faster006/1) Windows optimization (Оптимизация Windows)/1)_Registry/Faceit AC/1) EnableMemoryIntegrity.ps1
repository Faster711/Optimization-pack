# Включение Memory Integrity
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity' -Name 'Enabled' -Value 1

# Включение Hyper-V, который требуется для работы изоляции ядра
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All -NoRestart

# Включение изоляции виртуализации
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard' -Name 'EnableVirtualizationBasedSecurity' -Value 1

# Включение службы Device Guard
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard' -Name 'Enable' -Value 1

# Включение службы Hypervisor
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\hvservice' -Name 'Start' -Value 3

# Перезагрузка системы для применения всех изменений
Restart-Computer
