(prelude-require-packages '(evil
                            goto-chg
                            evil-surround
                            evil-visualstar
                            evil-numbers
                            evil-leader
                            evil-matchit
                            evil-nerd-commenter
                            evil-jumper
                            evil-exchange
                            evil-anzu
                            evil-iedit-state
                            hydra
                            ))



;;key mapping for turn on iimage mode
(define-key evil-normal-state-map (kbd ",ii") 'turn-on-iimage-mode)
(define-key evil-normal-state-map (kbd "s-g") 'helm-ag)
(define-key evil-normal-state-map (kbd "s-f") 'ido-find-file)
(define-key evil-normal-state-map (kbd "s-p") 'projectile-switch-project)
;;(define-key evil-normal-state-map (kbd "cc") 'evil-change-whole-line)

;; key mapping for nerdcommenter
(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
;; mimic config like vim-abolish
(define-key evil-normal-state-map "[b" 'previous-buffer)
(define-key evil-normal-state-map "]b" 'next-buffer)
(define-key evil-normal-state-map "n" 'evil-ex-search-next)
(define-key evil-normal-state-map "N" 'evil-ex-search-previous)
(define-key evil-normal-state-map "*" 'evil-ex-search-word-forward)
(define-key evil-normal-state-map "#" 'evil-ex-search-word-backward)
(define-key evil-normal-state-map "/" 'evil-ex-search-forward)
(define-key evil-normal-state-map (kbd "[ SPC") 'zilongshanren/open-line-above)
(define-key evil-normal-state-map (kbd "] SPC") 'zilongshanren/open-line-below)

;; for web-mode
(evil-declare-key 'normal web-mode-map
  ",r" 'open-in-browser)

(evil-declare-key 'normal web-mode-map
  ",t" 'imp-visit-buffer)

;; for Info-mode
(evil-declare-key 'normal Info-mode-map
  "q" 'Info-exit
  "u" 'Info-up)

;; for lua-mode
(evil-declare-key 'normal lua-mode-map
  (kbd "C-c C-e") 'lua-send-current-line)

(evil-declare-key 'normal lua-mode-map
  ",r" 'lua-send-buffer)

;; for elisp mode
(evil-declare-key 'normal elisp-slime-nav-mode-map
  (kbd "gd") 'find-function)
(evil-declare-key 'normal elisp-slime-nav-mode-map
  (kbd ",?") 'elisp-slime-nav-describe-elisp-thing-at-point)

;;; snagged from Eric S. Fraga
;;; http://lists.gnu.org/archive/html/emacs-orgmode/2012-05/msg00153.html
(defun prelude-evil-key-bindings-for-org ()
  ;;(message "Defining evil key bindings for org")
  (evil-declare-key 'normal org-mode-map
    "gk" 'outline-up-heading
    "gj" 'outline-next-visible-heading
    "H" 'org-beginning-of-line ; smarter behaviour on headlines etc.
    "L" 'org-end-of-line ; smarter behaviour on headlines etc.
    "t" 'org-todo ; mark a TODO item as DONE
    ",c" 'org-cycle
    (kbd "TAB") 'org-cycle
    ",e" 'org-export-dispatch
    ",n" 'outline-next-visible-heading
    ",p" 'outline-previous-visible-heading
    ",t" 'org-set-tags-command
    ",u" 'outline-up-heading
    "$" 'org-end-of-line ; smarter behaviour on headlines etc.
    "^" 'org-beginning-of-line ; ditto
    "-" 'org-ctrl-c-minus ; change bullet style
    (kbd "s-h") 'org-metaleft ; out-dent
    (kbd "s-l") 'org-metaright ; indent
    (kbd "s-j") 'org-metadown
    (kbd "s-k") 'org-metaup
    ))
(prelude-evil-key-bindings-for-org)

(define-key evil-normal-state-map (kbd "C-k") 'evil-scroll-up)
(define-key evil-normal-state-map (kbd "C-j") 'evil-scroll-down)

;; set , for leader key
(define-key evil-normal-state-map "K" 'evil-repeat-find-char-reverse)

;;; enable ace-jump mode with evil-mode
(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-char-mode)

(define-key evil-normal-state-map
  (kbd "s-d") 'prelude-evil-scroll-down-other-window)

(define-key evil-normal-state-map
  (kbd "s-u") 'prelude-evil-scroll-up-other-window)

(define-key evil-normal-state-map (kbd "C-A")
  'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-S-A")
  'evil-numbers/dec-at-pt)

;; rebind g,k to gj and gk
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)


(define-key evil-normal-state-map
  (kbd "Y") 'prelude-yank-to-end-of-line)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Evil Visual state map
(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd "x") 'er/expand-region)
(define-key evil-visual-state-map (kbd "X") 'er/contract-region)
(define-key evil-visual-state-map (kbd "C-r") 'zilongshanren/evil-quick-replace)
(define-key evil-visual-state-map (kbd ">") 'prelude-shift-right-visual)
(define-key evil-visual-state-map (kbd "<") 'prelude-shift-left-visual)

;; Evil insert state map
(define-key evil-insert-state-map "\C-e" 'end-of-line)
(define-key evil-insert-state-map "\C-n" 'next-line)
(define-key evil-insert-state-map "\C-p" 'previous-line)
(define-key evil-insert-state-map "\C-k" 'kill-line)
(define-key evil-insert-state-map (kbd "s-f") 'forward-word)
(define-key evil-insert-state-map (kbd "s-b") 'backward-word)
;; (define-key evil-insert-state-map (kbd "C-c C-e") 'lua-send-region)

;; for lua-mode
(evil-declare-key 'insert lua-mode-map
  (kbd "RET") 'evil-ret-and-indent)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (define-key evil-ex-search-keymap (kbd "C-r") 'evil-paste-from-register)

;; Evil Emacs state map
(define-key evil-emacs-state-map "[b" 'previous-buffer)
(define-key evil-emacs-state-map "]b" 'next-buffer)

(evil-add-hjkl-bindings ibuffer-mode-map 'emacs)
(evil-add-hjkl-bindings org-agenda-mode-map 'emacs)
(evil-add-hjkl-bindings dired-mode-map 'emacs)
(evil-add-hjkl-bindings help-mode-map 'emacs)
(evil-add-hjkl-bindings elfeed-search-mode-map 'emacs)
(evil-add-hjkl-bindings elfeed-show-mode-map 'emacs)


(evil-add-hjkl-bindings package-menu-mode-map 'emacs)
(evil-add-hjkl-bindings Info-mode-map 'emacs)

;; define c-w h,j,k,l to window movement in evil-eamcs mode
(define-key evil-emacs-state-map (kbd "C-w h") 'evil-window-left)
(define-key evil-emacs-state-map (kbd "W") 'magit-copy-item-as-kill)
(define-key evil-emacs-state-map (kbd "C-w j") 'evil-window-down)
(define-key evil-emacs-state-map (kbd "C-w k") 'evil-window-up)
(define-key evil-emacs-state-map (kbd "C-w l") 'evil-window-right)

;; for emacs shell mode
(define-key evil-emacs-state-map (kbd "s-b") 'ido-switch-buffer)
(define-key evil-emacs-state-map (kbd "s-f") 'ido-find-file)
(evil-define-key 'emacs term-raw-map (kbd "C-w")
'evil-delete-backward-word)
;;add c-w delete to term-mode
;TODO: add a better way to delete word backward in term mode
;; (add-hook 'term-mode-hook (lambda()
;; (define-key evil-emacs-state-map (kbd "C-w") 'evil-delete-backward-word)))


(define-key evil-emacs-state-map (kbd "s-p") 'projectile-switch-project)
;;(require 'eshell)
;; (evil-declare-key 'emacs eshell-mode-map
;;   "c-p" 'eshell-previous-matching-input-from-input
;;   "c-n" 'eshell-next-matching-input-from-input)

;; Evil Normal state map
;; key map for magit mode
;;
;; Magit from avsej
;;
(evil-add-hjkl-bindings magit-log-mode-map 'emacs)
(evil-add-hjkl-bindings occur-mode-map 'emacs)
(evil-add-hjkl-bindings magit-commit-mode-map 'emacs)
(evil-add-hjkl-bindings magit-branch-manager-mode-map 'emacs
  "K" 'magit-discard-item
  "L" 'magit-key-mode-popup-logging)
(evil-add-hjkl-bindings magit-status-mode-map 'emacs
  "K" 'magit-discard-item
  "l" 'magit-key-mode-popup-logging
  "h" 'magit-toggle-diff-refine-hunk)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Evil EX command state map
;; Other useful Commands
;;
(evil-ex-define-cmd "W"     'evil-write-all)
(evil-ex-define-cmd "Tree"  'speedbar-get-focus)
(evil-ex-define-cmd "linum" 'linum-mode)
(evil-ex-define-cmd "Align" 'align-regexp)
(evil-ex-define-cmd "Rename" 'prelude-rename-buffer-and-file)
(define-key evil-ex-completion-map "\C-a" 'move-beginning-of-line)
(define-key evil-ex-completion-map "\C-b" 'backward-char)
(define-key evil-ex-completion-map "\C-k" 'kill-line)
(define-key minibuffer-local-map (kbd "C-w") 'evil-delete-backward-word)


(defhydra helm-key-bindings(:color teal)
  "
 Helm:
_o_: swoop
_i_menu:
_d_wim:
_r_tags:
_s_ymbol:
_f_unction:
_p_aste kill ring:
"
  ("o" helm-swoop nil)
  ("i" helm-imenu nil)
  ("d" helm-gtags-dwim nil)
  ("r" helm-gtags-find-rtag nil)
  ("s" helm-gtags-find-symbol nil)
  ("f" helm-find-files nil)
  ("p" helm-show-kill-ring nil)
  ("q" nil nil  :color blue))

(defhydra magit-key-bindings(:color teal)
  "
 Magit:
_s_tatus w
_l_og:
_b_lame:
"
  ("s" magit-status nil)
  ("l" magit-file-log nil)
  ("b" magit-blame-mode nil)
  ("q" nil nil :color blue)
  )

(defhydra hydra-git-gutter
    (:pre (git-gutter-mode 1))
  "
Git:
_j_: next hunk        _s_tage hunk     _q_uit
_k_: previous hunk    _r_evert hunk    _Q_uit and deactivate git-gutter
                      _p_opup hunk

set start _R_evision
"
  ("j" git-gutter:next-hunk          nil)
  ("k" git-gutter:previous-hunk      nil)
  ("s" git-gutter:stage-hunk         nil)
  ("r" git-gutter:revert-hunk        nil)
  ("p" git-gutter:popup-hunk         nil)
  ("R" git-gutter:set-start-revision nil)
  ("q" nil                  nil :color blue)
  ("Q" (git-gutter-mode -1) nil :color blue))

(defhydra hydra-projectile-other-window (:color teal)
  "projectile-other-window"
  ("f"  projectile-find-file-other-window        "file")
  ("g"  projectile-find-file-dwim-other-window   "file dwim")
  ("d"  projectile-find-dir-other-window         "dir")
  ("b"  projectile-switch-to-buffer-other-window "buffer")
  ("q"  nil                                      "cancel" :color blue))

(defhydra hydra-projectile (:color teal)
  "
     PROJECTILE: %(projectile-project-root)

     Find File            Search/Tags          Buffers                Cache
------------------------------------------------------------------------------------------
_f_: file            _a_: ag                _i_: helm buffer list           _c_: cache clear
_r_: recent file     _g_: update gtags      _b_: switch to buffer  _x_: remove known project
_d_: dir             _o_: multi-occur     _s-k_: Kill all buffers  _X_: cleanup non-existing
                     ^^^^_y_: copy filename            _z_: cache current

"
  ("a"   helm-ag                      nil)
  ("b"   projectile-switch-to-buffer        nil)
  ("c"   projectile-invalidate-cache        nil)
  ("d"   projectile-find-dir                nil)
  ("f"   helm-browse-project               nil) ;;http://stackoverflow.com/questions/14313851/emacs-opening-any-file-in-a-large-repo
  ;; ("ff"  projectile-find-file-dwim          nil)
  ("g"   ggtags-update-tags                 nil)
  ;; ("s-g" ggtags-update-tags                 nil)
  ("i"   helm-buffers-list                 nil)
  ;; ("I"   ibuffer                 nil)
  ("K"   projectile-kill-buffers            nil)
  ("s-k" projectile-kill-buffers            nil)
  ("y"   prelude-copy-file-name-to-clipboard             nil)
  ("o"   projectile-multi-occur             nil)
  ("s-p" projectile-switch-project          "switch project")
  ("p"   projectile-switch-project          nil)
  ("s"   projectile-switch-project          nil)
  ("r"   projectile-recentf                 nil)
  ("x"   projectile-remove-known-project    nil)
  ("X"   projectile-cleanup-known-projects  nil)
  ("z"   projectile-cache-current-file      nil)
  ("`"   hydra-projectile-other-window/body "other window")
  ("q"   nil                                "cancel" :color blue))





(defhydra c++-compile-run-key-bindings (:color teal)
  "
 C++-mode:
_b_uild
"
  ("b" zilongshanren/compile nil)
  ("r" zilongshanren/run nil)
  ("q" nil nil :color blue)
  )

(defhydra org-key-bindings (:color teal)
  "
 Org-mode:
_a_genda:
_l_ink:
_c_apture:
_t_odo:
_T_ags:
_h_tml presentation:

"
  ("a" org-agenda nil)
  ("l" org-mac-grab-link nil)
  ("L" jcs-get-link)
  ("c" org-capture nil)
  ("t" org-todo nil)
  ("T" org-set-tags-command nil)
  ("h" org-reveal-export-to-html-and-browse nil)
  ("q" nil nil :color blue)
  )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; evil-leader config

(evil-leader/set-key
  "s1" 'delete-other-windows
  "s2" 'split-window-below
  "s3" 'split-window-right
  "so" 'delete-other-window
  "sw" 'switch-window
  "s0" 'delete-window
  "su" 'winner-undo
  "sr" 'winner-redo
  "xm" 'smex
  "xf" 'ido-find-file
  "xb" 'ido-switch-buffer
  "xc" 'save-buffers-kill-terminal
  "xk" 'ido-kill-buffer
  "xs" 'save-buffer
  "xz" 'suspend-frame
  "ai" 'org-pomodoro
  "ao" 'org-clock-out
  "q" 'org-clock-goto
  "p" 'hydra-projectile/body
  "v" 'evil-visual-block
  "ce" 'expand-member-functions
  "f" 'ff-find-other-file
  "zf" 'evil-toggle-fold
  ",w" 'evil-ace-jump-word-mode
  ",l" 'evil-ace-jump-line-mode
  "e"  'hydra-error/body
  "g"  'hydra-git-gutter/body
  "o"  'org-key-bindings/body
  "h"  'helm-key-bindings/body
  "m"  'magit-key-bindings/body
  "xi" 'imenu
  "!" 'shell-command
  "=" 'prelude-indent-defun
  "sh" 'evil-search-highlight-persist-remove-all
  "cn" '4clojure-next-question
  "cp" '4clojure-previous-question
  "cc" '4clojure-check-answers
  "bm" 'bookmark-set
  "nl" 'evil-ex-nohighlight
  )


(evil-leader/set-key-for-mode 'cmake-mode "?" 'cmake-help)
(evil-leader/set-key-for-mode 'ag-mode "e" 'wgrep-change-to-wgrep-mode)
(evil-leader/set-key-for-mode 'c++-mode "b" 'c++-compile-run-key-bindings/body)

;; The following settings must be fore (requre 'evil)
;; (setq evil-want-C-u-scroll t)
(provide 'personal-evil-keybindings)
