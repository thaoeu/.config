import anki.sync, anki.hooks, aqt

addr = "http://192.168.31.51:27701/" # put your server address here
anki.sync.SYNC_BASE = "%s" + addr
def resetHostNum():
    aqt.mw.pm.profile['hostNum'] = None
anki.hooks.addHook("profileLoaded", resetHostNum)
