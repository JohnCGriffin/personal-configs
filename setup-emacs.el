
(require 'package)

(setq package-user-dir "/home/griffin/.emacs.d/elpa")
(setq package-archives
      '(("gnu"   . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

(package-initialize)
(package-refresh-contents)
(package-install 'racket-mode)
(package-install 'tuareg)
(package-install 'company)
(package-install 'rust-mode)
(package-install 'go-mode)
(package-install 'vterm)
