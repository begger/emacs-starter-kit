;; Keyboard and mouse
(setq
 ns-command-modifier   'meta       ; Apple/Command key is Meta
 ns-alternate-modifier 'super      ; Option is the Mac Option key
 mouse-wheel-scroll-amount '(1)
 mouse-wheel-progressive-speed nil
 )

(global-set-key (kbd "M-z") 'undo)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-/") 'comment-or-uncomment-region)
(global-set-key (kbd "M-l") 'goto-line)
(global-set-key (kbd "C-S-f") 'indent-buffer)
(global-set-key (kbd "M-q")  'save-buffers-kill-terminal)
(global-unset-key "\C-x \C-c")

(global-set-key (kbd "C-x C-v") 'revert-buffer-non-interactive)
(global-set-key (kbd "C-;") 'switch-to-previous-buffer)
(global-set-key (kbd "C-,") 'previous-buffer)
(global-set-key (kbd "C-.") 'next-buffer)

(defun save-compile-and-send ()
  (interactive)
  (save-buffer)
  (slime-compile-and-load-file))

(add-hook 'clojure-mode-hook
         (lambda ()
            (message "dude I got activated")))



