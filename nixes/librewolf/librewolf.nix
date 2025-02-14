{
  programs.firefox = {
    enable = true;
    package = pkgs.librewolf;
    # policies
    # policy options are at: about:policies#documentation
    policies = {
      # extensions
      # extension/add-on ID strings are at: about:support
      ExtensionSettings = {
        # Auto Tab Discard
        "{c2c003ee-bd69-42a2-b0e9-6f34222cb046}".install_url = "https://addons.mozilla.org/firefox/downloads/file/4045009/auto_tab_discard-0.6.7.xpi";
        # Bitwarden
        "{446900e4-71c2-419f-a6a7-df9c091e268b}".install_url = "https://addons.mozilla.org/firefox/downloads/file/4407804/bitwarden_password_manager-2024.12.3.xpi";
        # ClearURLs
        "{74145f27-f039-47ce-a470-a662b129930a}".install_url = "https://addons.mozilla.org/firefox/downloads/file/4064884/clearurls-1.26.1.xpi";
        # LeechBlock NG
        "leechblockng@proginosko.com".install_url = "https://addons.mozilla.org/firefox/downloads/file/4374316/leechblock_ng-1.6.6.xpi";
        # Sidebery
        "{3c078156-979c-498b-8990-85f7987dd929}".install_url = "https://addons.mozilla.org/firefox/downloads/file/4246774/sidebery-5.2.0.xpi";
        # uBlock Origin
        "uBlock0@raymondhill.net".install_url = "https://addons.mozilla.org/firefox/downloads/file/4391011/ublock_origin-1.61.2.xpi";
        # Video Speed Controller
        "{7be2ba16-0f1e-4d93-9ebc-5164397477a9}".install_url = "https://addons.mozilla.org/firefox/downloads/file/3756025/videospeed-0.6.3.3.xpi";
        # Vimium
        "{d7742d87-e61d-4b78-b8a1-b469842139fa}".install_url = "https://addons.mozilla.org/firefox/downloads/file/4259790/vimium_ff-2.1.2.xpi";
        # unused extensions:
        # Awesome Screenshot: Screen capture, Annotate
        # https://addons.mozilla.org/en-US/firefox/addon/screenshot-capture-annotate/
        # Save Screenshot
        # https://addons.mozilla.org/en-US/firefox/addon/savescreenshot/
        # Take Webpage Screenshots Entirely - FireShot
        # https://addons.mozilla.org/en-US/firefox/addon/fireshot/
      };
      # not using ManagedBookmarks because it:
      # "Configures a list of bookmarks managed by an administrator that cannot be changed by the user."
      # importing them via the bookmarks folder is used instead
    };
  };
}
