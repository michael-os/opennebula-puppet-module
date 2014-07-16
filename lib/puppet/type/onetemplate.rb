Puppet::Type.newtype(:onetemplate) do
  @doc = "Type for managing templates in OpenNebula using the onevm" +
         "wrapper command."

  ensurable do
    newvalue(:present) do
      provider.create
    end

    newvalue(:absent) do
      provider.destroy
    end

    defaultto :present
  end

  # General template config
  newparam(:name) do
    desc "Name of template."

    isnamevar
  end

  newparam(:memory) do
    desc "Memory allocation for template in megabytes."
  end

  newparam(:cpu) do
    desc "Percentage of CPU divided by 100 required for the Virtual Machine. " +
      "Half a processor is written 0.5."
  end

  newparam(:vcpu) do
    desc "Virtual CPUs"
  end

  # OS booting template config
  # Kernel section
  newparam(:os_kernel) do
    desc "Path to the OS kernel to boot the template. Required in Xen."
  end

  # Ramdisk section
  newparam(:os_initrd) do
    desc "Path to the initrd image."
  end

  # Boot section
  newparam(:os_arch) do
    desc "CPU architecture."
  end

  newparam(:os_root) do
    desc "Device to be mounted as root."
  end

  newparam(:os_kernel_cmd) do
    desc "Arguments for the booting kernel."
  end

  newparam(:os_bootloader) do
    desc "Path to the bootloader executable."
  end

  newparam(:os_boot) do
    desc "Boot device type: hd,fd,cdrom,network"
  end

  # Features section
  newparam(:acpi) do
      desc "Enable ACPI"
  end

  newparam(:pae) do
      desc "Enable PAE"
  end

  newparam(:pci_bridge) do
      desc "PCI Bridging"
  end

  # Template Storage config
  newparam(:disks) do
    desc "Array of disk definitions."
  end

  # Template Network config
  newparam(:nics) do
    desc "Array of nic definitions."
  end

  # Template Input/Output config
  newparam(:graphics_type) do
    desc "Graphics type - vnc or sdl"

    defaultto "vnc"
  end

  newparam(:graphics_listen) do
    desc "IP to listen on."

    defaultto "0.0.0.0"
  end

  newparam(:graphics_port) do
    desc "Port for the VNC server. If left empty this is automatically set."
  end

  newparam(:graphics_passwd) do
    desc "VNC password."

    defaultto ""
  end

  newparam(:graphics_keymap) do
    desc "keyboard configuration locale to use in the VNC display"

    defaultto ""
  end

  # Template Context config
  # generic context
  newparam(:context) do
    desc "Pass context hash to vm."
  end

  # network & SSH section
  newparam(:context_ssh) do
      desc "Activate SSH contextualization"
  end

  newparam(:context_ssk_pubkey) do
      desc "Root SSH pub key contextualization"
  end

  newparam(:content_network) do
      desc "Activate network contextualization"
  end

  newparam(:context_onegate) do
      desc "Activate OneGate token in contextualization"
  end

  # Files section
  newparam(:context_files) do
      desc "Array of additional contextualization files"
  end

  newparam(:context_variables) do
      desc "Hash of additional contextualization variables"
  end

  # Template Scheduling config
  # placement section
  newparam(:context_placement_host) do
      desc "Host where to place the vm using this template"
  end

  newparam(:context_placement_cluster) do
      desc "Cluster where to place the vm using this template"
  end

  # policy section
  newparam(:context_policy) do
      desc "Activate policy how to distribute vm using this template"
  end
end