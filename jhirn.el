;;add vendor dir
(add-to-list 'load-path (concat dotfiles-dir "/vendor"))
(progn (cd "~/.emacs.d/vendor")
       (normal-top-level-add-subdirs-to-load-path))

;; Add my personal figs
(map 'list (lambda (f) (load-file (concat  dotfiles-dir "/figs/" f)))
     (list "colors.el"
           "move-backups.el"
           "tidy.el"))


;; Path fuckery thanks to OSX not honoring .bash_profiles... 
(setenv "PATH" (concat "/opt/local/bin" ":"
                       "/usr/local/bin" ":"
                       (getenv "PATH")))
(setq exec-path (append exec-path '("/opt/local/bin")))
(setq exec-path (append exec-path '("/usr/local/mongo/bin")))

(defun maximize-frame ()
  (interactive)
  (set-frame-position (selected-frame) 0 0)
  (set-frame-size (selected-frame) 1000 1000))


(defun revert-buffer-non-interactive()
  (interactive "")
  (revert-buffer t t))


;;You are... so beautiful... to meeeeeeeeeeeeeeeeeeeeeeeeeeeeee
(pastels-color-theme)
(set-frame-parameter (selected-frame) 'alpha '(90 80))
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;rspec-mode
(require 'rspec-mode)
(rspec-mode)

;;rvm-mode
(require 'rvm)

;;cucumber
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

(server-start)

;;autocomplete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat dotfiles-dir "vendor/auto-complete-1.3/dict"))
(ac-config-default)

;;rsense
(setq rsense-home (concat dotfiles-dir "vendor/rsense-0.3"))
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)
;; auto start rsense completion after . and ::
(add-hook 'ruby-mode-hook 
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-rsense-method)
            (add-to-list 'ac-sources 'ac-source-rsense-constant)))

;;textmate mode
(require 'textmate)
(textmate-mode)

;;yasnippet
(require 'yasnippet)
(yas/initialize)
(yas/load-directory (concat dotfiles-dir "vendor/yasnippet-0.6.1c/snippets"))
(yas/load-directory (concat dotfiles-dir "vendor/cucumber/snippets"))
(yas/load-directory (concat dotfiles-dir "xtra-snippets"))


;;packin a ack in the back of the emacs
(require 'ack-emacs)
(require 'ack-in-project)

;;buffer switching
(defun switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer)))

;;keybindings last
(load-file (concat dotfiles-dir "figs/keybindings.el"))