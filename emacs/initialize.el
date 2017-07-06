(use-package org-ref)

(require 'iso-transl)

(setq use-package-always-ensure t)

(setq scroll-margin 0)
(setq scroll-conservatively 10000)
(setq scroll-preserve-screen-position t)

(use-package base16-theme
  :ensure t
  :config
  (load-theme 'base16-chalk t))

(use-package smex
:config (smex-initialize))

(use-package ergoemacs-mode
:init
  (setq ergoemacs-theme nil)
  (setq ergoemacs-keyboard-layout "es")
:config
  (ergoemacs-mode 1)
)

(use-package which-key
:config (which-key-mode))

(global-auto-revert-mode 1)
(add-hook 'dired-mode-hook 'auto-revert-mode)

;(global-set-key [f8] 'neotree-toggle)
(global-set-key (kbd "<f5>") 'magit-status)
(global-set-key [f12] 'ess-eval-region-or-line-and-step)
(global-set-key (kbd "C-k") 'comment-or-uncomment-region)
;(global-set-key (kbd "C-x C-a") 'mark-whole-buffer)

;; Switch buffers with ctrl-tab
(global-set-key [C-tab] 'other-window)
(global-set-key [C-iso-lefttab] 
    (lambda ()
      (interactive)
      (other-window -1)))
(define-key org-mode-map [C-tab] nil)

(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

(setq org-support-shift-select t)

(add-hook 'text-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'org-bullets-mode)
(add-hook 'org-mode-hook 'org-indent-mode)

(set-face-attribute 'org-level-1 nil
  :inherit 'outline-1
  :foreground "#909090"
  :background "#000000"
  :weight 'bold
  :font "Noto Sans"
  :height 1.2)

(set-face-attribute 'org-level-2 nil
  :inherit 'outline-1
  :foreground "#b0b0b0"
  :background "#222222"
  :weight 'semi-bold
  :font "Noto Sans"
  :height 1.1)

(set-face-attribute 'org-level-3 nil 
  :inherit 'outline-3
  :foreground "#909090"
  :font "Noto Sans"
  :weight 'bold)

(set-face-attribute 'org-level-4 nil
  :inherit 'outline-3
  :foreground "#909090"
  :font "Noto Sans"
  :weight 'normal)

(set-face-attribute 'org-level-5 nil
  :inherit 'outline-4
  :foreground "#909090"
  :font "Noto Sans"
  :weight 'normal)

(set-face-attribute 'org-level-6 nil
  :inherit 'outline-4
  :foreground "#909090"
  :font "Noto Sans")

(set-face-attribute 'org-level-8 nil
  :inherit 'outline-7
  :foreground "#909090"
  :font "Noto Sans")

(setq LaTeX-math-list
  (quote (
     ("B" "mathbb" "" nil)
     ("K" "mathfrack" "" nil)
     ("R" "mathrm" "" nil)
     ("O" "overline" "" nil)
     ("=" "cong" "" nil)
     ("C-e" "emptyset" "" nil)
     ("<right>" "longrightarrow" "" nil)
     ("<left>" "longleftarrow" "" nil)
     ("C-<right>" "Longrightarrow" "" nil)
     ("C-<left>" "Longleftarrow" "" nil)
     ("^" "widehat" "" nil)
     ("~" "widetilde" "" nil)
     ("'" "partial" "" nil)
     ("0" "varnothing" "" nil)
     ("C-(" "left(" "" nil)
     ("C-)" "right)" "" nil)
     )))

(use-package cdlatex
:ensure t
:init
  (setq cdlatex-env-alist
    '(("def" "\\begin{definition}\n\\end{definition}\n" nil)
      ("thm" "\\begin{theorem}\nAUTOLABEL\n\n\\end{theorem}\n" nil)
      ("lem" "\\begin{lemma}\n\\end{lemma}\n" nil)
      ("prop" "\\begin{proposition}\n\\end{proposition}\n" nil)
      ("cor" "\\begin{corollary}\n\\end{corollary}\n" nil)
      ("rem" "\\begin{remark}\n\\end{remark}\n" nil)
      ("proof" "\\begin{proof}\n\\end{proof}\n" nil)
      ("con" "\\begin{conjecture}\nAUTOLABEL\n\n\\end{conjecture}\n" nil)
      ("exe" "\\begin{exercise}\n  \\begin{statement}\n    \n  \\end{statement}\n  \\begin{answer}\n    \n  \\end{answer}\n\\end{exercise}\n" nil)
      ("ex" "\\begin{ex}\n\\end{ex}\n" nil)
      ("cas" "\\begin{cases}?\\end{cases}" nil)))

  (setq cdlatex-command-alist
    '(("def" "Insert definition env" "" cdlatex-environment ("def") t nil)
      ("thm" "Insert theorem env" "" cdlatex-environment ("thm") t nil)
      ("lem" "Insert lemma env" "" cdlatex-environment ("lem") t nil)
      ("prop" "Insert proposition env" "" cdlatex-environment ("prop") t nil)
      ("cor" "Insert corollary env" "" cdlatex-environment ("cor") t nil)
      ("rem" "Insert remark env" "" cdlatex-environment ("rem") t nil)
      ("proof" "Insert proof env" "" cdlatex-environment ("proof") t nil)
      ("eq" "Insert short equation env" "\\[ ? \\]" cdlatex-position-cursor nil t nil)
      ("oi" "Insert an open interval" "]?[" cdlatex-position-cursor nil t t)
      ("exe" "Insert an exercise env" "" cdlatex-environment ("exe") t nil)
      ("ex" "Insert an example env" "" cdlatex-environment ("ex") t nil)
      ("set" "Insert a set" "\\{?\\}" cdlatex-position-cursor nil t t)
      ("frp" "Insert a fraction with partials" "\\frac{\\partial}{\\partial ?}" cdlatex-position-cursor nil t t)
      ("cas" "Insert a cases env" cdlatex-environment ("cas") t t)
      ("lim" "Insert a limit" "\\lim_{x \\to ?} f(x)" cdlatex-position-cursor nil t t)))

  (setq cdlatex-math-symbol-alist
    '((?i ("\\in" "\\infty" "\\imath"))
      (?t ("\\to" "\\times" "\\tau"))
      (?p ("\\pi" "\\varpi"))
      (?p ("\\subset" "\\upsilon"))
      (?n ("\\ne" "\\nu" "\\nabla"))
      (?c ("\\cap" "\\cup" "\\cos"))
      (?: ("\\colon"))
      ;(?< ("\\leftarrow" "\\Leftarrow" "\\longleftarrow" "\\Longleftarrow"))
      ;(?> ("\\rightarrow" "\\Rightarrow" "\\longrightarrow" "\\Longrightarrow"))
  ))

  (setq cdlatex-math-modify-alist
    '((?t "\\text"     "\\text"     t nil nil)
      (?q ("\\mathbb"  nil          t nil nil)
      (?o "\\overline" "\\overline" t nil nil))))

:config
  (add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)   ; with AUCTeX LaTeX mode
  (add-hook 'latex-mode-hook 'turn-on-cdlatex)   ; with Emacs latex mode
)
