package edu.harvard.cscie56

import java.util.concurrent.ConcurrentHashMap
import java.util.concurrent.ConcurrentMap

class SessionData {

    private ConcurrentMap<String, Object> attributes = new ConcurrentHashMap<String, Object>();
    private long lastAccessed
    private boolean invalidated = false

    final long creationTime = System.currentTimeMillis()

    int maxInactiveInterval = 30 * 60 * 1000

    long getLastAccessedTime() { lastAccessed }

    private void setLastAccessed() { lastAccessed = System.currentTimeMillis() }
    String setId ='it gets called dont worry '
    String getId() return setID

}