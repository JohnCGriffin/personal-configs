

;; General

(progn

  (require 'package)


  (add-to-list 'package-archives
					; was "http://melpa.milkbox.net/packages/"
	       '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)

  (set-language-environment "UTF-8")
  (set-default-coding-systems 'utf-8)

  (menu-bar-mode -1)

  (setq make-backup-files nil)
  (setq auto-save-default nil)

  (setq neo-smart-open t)
  (setq tab-width 4)

  (set-face-foreground 'font-lock-comment-face "color-240")

  (load-theme 'donkey))



;; Python

(progn

  (setq python-shell-interpreter "python3"))



;; GOLANG mostly from johnsogg.github.io/emacs-golang

(progn

  ;; Define function to call when go-mode loads

  (defun my-go-mode-hook ()
    (defvar gofmt-command "goimports")               ; gofmt uses invokes goimports

    (add-to-list 'load-path "~/.emacs.d/go/")


    (add-hook 'before-save-hook 'gofmt-before-save)  ; gofmt before every save
    (setq tab-width 3)
    (set (make-local-variable 'compile-command)
	 (concat "go build -v "
		 "&& go test -v "
		 "-coverprofile=/tmp/coverage.out "
		 "&& go vet"))

    (defvar go--coverage-current-file-name "/tmp/coverage.out")

    ;(load-library "go-guru")

    ;; guru settings
    (go-guru-hl-identifier-mode)                    ; highlight identifiers


    ;; Key bindings specific to go-mode
    (local-set-key (kbd "M-.") 'godef-jump)         ; Go to definition
    (local-set-key (kbd "M-*") 'pop-tag-mark)       ; Return from whence you came
    (local-set-key (kbd "M-p") 'compile)            ; Invoke compiler
    (local-set-key (kbd "M-P") 'recompile)          ; Redo most recent compile cmd
    (local-set-key (kbd "M-]") 'next-error)         ; Go to next error (or msg)
    (local-set-key (kbd "M-[") 'previous-error)     ; Go to previous error or msg

    ;; Ensure the GO autocomplete in go-mode
    (with-eval-after-load 'go-mode
      (require 'go-guru)
      (require 'go-rename)
      (require 'go-autocomplete)
      (flycheck-mode 1)
      (auto-complete-mode 1)))

  (add-hook 'go-mode-hook 'my-go-mode-hook))


