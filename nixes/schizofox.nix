{ config, pkgs, inputs, ... }:

{
  # adds schizofox (has source in flake.nix) to configure firefox
  # config options: https://github.com/schizofox/schizofox/tree/main/flake/modules/home-manager/options
  imports = [ inputs.schizofox.homeManagerModule ];
  programs.schizofox = {
    enable = true;

    theme = {
      colors = {
        background-darker = "251818";
        background = "452d2d";
        foreground = "f4cdcd";
      };
      #font = "";
    };

    search = {
      defaultSearchEngine = "Brave";
      removeEngines = ["Bing" "Amazon.com" "eBay" "Twitter" "Wikipedia" "DuckDuckGo"];
      searxUrl = "https://searx.be";
      searxQuery = "https://searx.be/search?q={searchTerms}&categories=general";
      addEngines = [
        {
          Name = "Brave";
          Description = "";
          Alias = "";
          Method = "GET";
          URLTemplate = "https://search.brave.com/search?q={searchTerms}";
        }
        {
          Name = "Google";
          Description = "";
          Alias = "g";
          Method = "GET";
          URLTemplate = "https://www.google.com/search?q={searchTerms}";
        }
        {
          Name = "NixOS Packages (unstable)";
          Description = "";
          Alias = "n";
          Method = "GET";
          URLTemplate = "https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query={searchTerms}";
        }
      ];
    };

    security = {
      sanitizeOnShutdown = {
        enable = true;
        sanitize = {
          history = false;
        };
      };
      sandbox = true;
    };

    misc = {
      displayBookmarksInToolbar = "newtab";
      disableWebgl = false;
      contextMenu.enable = true;
      bookmarks = [
        {
          # NixOS Packages (unstable)
          Title = "";
          URL = "https://search.nixos.org/packages";
          Favicon = "https://search.nixos.org/favicon.png";
          Placement = "toolbar";
        }
        {
          # picoGym
          Title = "";
          URL = "https://play.picoctf.org/practice";
          Favicon = "https://play.picoctf.org/apple-touch-icon.png";
          Placement = "toolbar";
        }
        {
          # THM
          Title = "";
          URL = "https://tryhackme.com/r/dashboard";
          Favicon = "https://tryhackme.com/r/favicon.png";
          Placement = "toolbar";
        }
        {
          # Typing Club
          Title = "";
          URL = "https://www.edclub.com/sportal/";
          Favicon = "https://static.typingclub.com/m/favicon.png";
          Placement = "toolbar";
        }
        {
          # monkeytype
          Title = "";
          URL = "https://monkeytype.com/";
          Favicon = "https://monkeytype.com/images/favicon/favicon.ico";
          Placement = "toolbar";
        }
        {
          # csTimer
          Title = "";
          URL = "https://www.cstimer.net/";
          Favicon = "https://www.cstimer.net/cstimer512x512.png";
          Placement = "toolbar";
        }
        {
          # Lofi Girl Radios（on YT)
          Title = "Lofi Girl Radios";
          URL = "https://www.youtube.com/playlist?list=PL6NdkXsPL07Il2hEQGcLI4dg_LTg7xA2L";
          Favicon = "https://lofigirl.com/wp-content/uploads/2023/09/cropped-LOFI-GIRL-LOGO-1-192x192.png";
          Placement = "toolbar";
        }
        {
          # Study Timing (on Google Sheets)
          Title = "Study Timing";
          URL = "https://docs.google.com/spreadsheets/d/1vtgf8IH6sxTVglUuasNGhSd5KAwD-TUXT3rYeL7bJgY/edit?";
          Favicon = "data:image/x-icon;base64,AAABAAEAEBAQAAEABAAoAQAAFgAAACgAAAAQAAAAIAAAAAEABAAAAAAAgAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAA////AFOoNAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACIiIgAAAAAiIiIiIgAAAiIRIiIiIAAiIhEiIiIiACIiESIiIiICIiIRIiIiIiIiIhEiIiIiIiIiESIiIiIiIiIRIiIiIiIhERERERESIiERERERERIgIiIRIiIiIgAiIhEiIiIiAAIiESIiIiAAACIiIiIiAAAAACIiIgAAD4HwAA4AcAAMADAACAAQAAgAEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIABAACAAQAAwAMAAOAHAAD4HwAA";
          Placement = "toolbar";
        }
      ];
    };

    extensions = {
      #simplefox.enable = true;
      extraExtensions = {
        # Auto Tab Discard
        "{c2c003ee-bd69-42a2-b0e9-6f34222cb046}".install_url = "https://addons.mozilla.org/firefox/downloads/file/4045009/auto_tab_discard-0.6.7.xpi";
        # Bitwarden
        "{446900e4-71c2-419f-a6a7-df9c091e268b}".install_url = "https://addons.mozilla.org/firefox/downloads/file/4407804/bitwarden_password_manager-2024.12.3.xpi";
        # ClearURLs
        "{74145f27-f039-47ce-a470-a662b129930a}".install_url = "https://addons.mozilla.org/firefox/downloads/file/4064884/clearurls-1.26.1.xpi";
        # LeechBlock NG
        "leechblockng@proginosko.com".install_url = "https://addons.mozilla.org/firefox/downloads/file/4374316/leechblock_ng-1.6.6.xpi";
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
    };
  };
}
