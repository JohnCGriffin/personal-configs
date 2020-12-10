
(require 'package)

(setq package-enable-at-startup nil)
(setq package-check-signature nil)
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
	("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; Conditional installations


(defmacro conditional-install (name)
  `(unless (package-installed-p (quote ,name))
     (package-refresh-contents)
     (package-install (quote ,name))))

(progn
  (unless (version<= emacs-version "25.3") ; as in Centos 7
    (conditional-install magit)
    (conditional-install markdown-mode))
  ;(conditional-install clojure-mode)
  ;(conditional-install cider)
  ;(conditional-install lsp-mode)
  (conditional-install yaml-mode)
  (conditional-install go-mode)
  (conditional-install flycheck)
  ;(conditional-install rust-mode)
  (conditional-install dockerfile-mode)
  ;(conditional-install lsp-python-ms)
  (conditional-install company))

(progn
  (add-hook 'c++-mode-hook
	    (lambda ()
	      (setq flycheck-gcc-language-standard "c++17")
	      (setq flycheck-clang-language-standard "c++17")
	      (flycheck-mode))))

;; (defun lsp-go-install-save-hooks ()
;;   (add-hook 'before-save-hook #'lsp-format-buffer t t)
;;   (add-hook 'before-save-hook #'lsp-organize-imports t t))

;; (progn

;;   (add-hook 'go-mode-hook 'lsp)
;;   (add-hook 'go-mode-hook #'lsp-go-install-save-hooks))


;; Basics

(progn

  (menu-bar-mode -1)
  (add-to-list 'load-path "~/.emacs.d/lisp/")
  (load-theme 'wombat t)

  (global-set-key (kbd "C-x g") 'magit-status)

  (fset 'yes-or-no-p 'y-or-n-p)

  (setq make-backup-files nil
	auto-save-default nil
	inhibit-startup-screen t
	ring-bell-function 'ignore
	tab-width 4
	c-base-indent 4
	c-basic-offset 4
	python-indent-offset 4
	python-indent-guess-indent-offset t
	python-indent-guess-indent-offset-verbose nil
	indent-tabs-mode nil))

