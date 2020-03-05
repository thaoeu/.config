// --------
/* appearance */
// --------

static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int gappih    = 5;       /* horiz inner gap between windows */
static const unsigned int gappiv    = 5;       /* vert inner gap between windows */
static const unsigned int gappoh    = 5;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 5;       /* vert outer gap between windows and screen edge */
static const int smartgaps          = 1;        /* 1 means no outer gap when there is only one window */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "思源黑体:size=10" };
static const char dmenufont[]       = "Source Code Pro:size=10";
static const char col_gray1[]       = "#192224";
static const char col_gray2[]       = "#a1a6a8";
static const char col_gray3[]       = "#e2e4e5";
static const char col_gray4[]       = "#F9F9F9";
static const char col_cyan[]        = "#ff5c57";
static const unsigned int baralpha = 0xd0;
static const unsigned int borderalpha = OPAQUE;
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
	[SchemeHid]  = { col_cyan,  col_gray1, col_cyan  },
};
static const unsigned int alphas[][3]      = {
	/*               fg      bg        border     */
	[SchemeNorm] = { OPAQUE, baralpha, borderalpha },
	[SchemeSel]  = { OPAQUE, baralpha, borderalpha },
};
/* commands */
//static const char *upvol[] = { "amixer", "set", "Master", "2+", NULL};
//static const char *downvol[] = {"amixer", "set", "Master", "2-", NULL};


//static const char *upvol[] = { "amixer", "-q", "sset", "Master", "1%+", NULL };
//static const char *downvol[] = { "amixer", "-q", "sset", "Master", "1%-", NULL };
//static const char *mute[] = { "amixer", "-q", "-D", "pulse", "sset", "Master", "toggle", NULL };

// --------
/* tagging */
// --------
static const char *tags[] = { "so1", "2ge", "a3x", "4ro", "o5o", "6cf", "c7b", "ut8", "sr9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "",      tile },    /* first entry is default */
	{ "<(_ _)>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "st", NULL };
static const char *konsole[] = { "konsole", NULL };
static const char *screenshot[] = { "deepin-screenshot", NULL };
static const char *ranger[] = { "dolphin", NULL };
static const char *krunner[] = { "krunner", NULL };
static const char *keynav[] = { "keynav", NULL };
static const char *chrome[] = { "google-chrome-stable", NULL };
static const char *firefox[] = { "firefox", NULL };
static const char *vivaldi[] = { "vivaldi-stable", NULL };
static const char scratchpadname[] = "scratchpad";
static const char *scratchpadcmd[] = { "st", "-t", scratchpadname, "-g", "80x24", NULL };
static const char *volup[]   = { "/home/qj/Script/vol-up.sh",  NULL };
static const char *up1[]   = { "/home/qj/Script/vol1u.sh",  NULL };
static const char *voldown[] = { "/home/qj/Script/vol-down.sh",  NULL };
static const char *down1[] = { "/home/qj/Script/vol1d.sh",  NULL };
static const char *mutevol[] = { "/home/qj/Script/vol-toggle.sh",  NULL };
static const char *mute[] = {"amixer", "set", "Master", "toggle", NULL};
static const char *wpcmd[]	 = { "/home/qj/Script/wp-change.sh", NULL };
/*static const char Rule rules[] = {
				{ NULL, NULL, "ranger", 1 << 1, False,       True,       -1 },
};*/

static Key keys[] = {
	/* modifier                     key			 function        argument */

	{ MODKEY,					    XK_Return,	 spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_space,	 spawn,          {.v = dmenucmd } },
	{ MODKEY,	                   	XK_equal,	 spawn,		     {.v = voldown } },
    { MODKEY, 						XK_Insert,	 spawn,			 {.v = up1 } },
	{ 0,							XK_Insert,	 spawn,			 {.v = volup   } },
	{ MODKEY,                   	XK_backslash,spawn,			 {.v = volup   } },
	{ 0,							XK_Pause,	 spawn,			 {.v = voldown } },
    { MODKEY,						XK_Pause,    spawn,          {.v = down1 } },

	{ MODKEY,						XK_Insert,	 spawn,          {.v = wpcmd   } },
	{ MODKEY,                       XK_a,		 setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_o,		 setlayout,      {.v = &layouts[0]} },
	{ MODKEY,						XK_e,		 spawn,			 {.v = ranger } },
//	{ MODKEY,                       XK_u,		 setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_u,		 fullscreen,     {0} },
	{ MODKEY|ShiftMask,		        XK_u,		 setlayout,      {.v = &layouts[0]} },
//	{ MODKEY,                       XK_i,		 incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_i,		 spawn,			 {.v = keynav } },
	{ MODKEY,                       XK_s,		 spawn,			 {.v = screenshot } },
	{ MODKEY,                       XK_d,		 spawn,			 {.v = krunner } },
	{ MODKEY|ShiftMask,             XK_d,		 setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_h,		 focusstack,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_h,		 zoom,           {0} },
	{ MODKEY,						XK_t,		 spawn,			 {.v = konsole } },
	{ MODKEY,                       XK_l,		 focusstack,     {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_l,		 zoom,           {0} },
	{ MODKEY,                       XK_b,		 togglebar,      {0} },
	{ MODKEY,						XK_c,		 spawn,			 {.v = chrome } },
	{ MODKEY,						XK_f,		 spawn,			 {.v = firefox } },
	{ MODKEY,						XK_v,		 spawn,			 {.v = vivaldi } },
//	{ MODKEY,                       XK_p,		 incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_j,		 setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_k,		 setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Tab,		 view,           {0} },
	{ MODKEY|ShiftMask,             XK_w,	     killclient,     {0} },
	{ MODKEY,                       XK_comma,	 focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period,	 focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,	 tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period,	 tagmon,         {.i = +1 } },

	{ MODKEY|ShiftMask,             XK_space,	 togglefloating, {0} },
	{ MODKEY,	              		XK_apostrophe,	togglescratch,  {.v = scratchpadcmd } },

	{ MODKEY,                       XK_0,		 view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,		 tag,            {.ui = ~0 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button1,        togglewin,      {0} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

