package edu.harvard.cscie56;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

public class Tester {

    private static int errorCount = 0;

    public static void main(String[] args) {

        long start = System.currentTimeMillis();

        checkId();

        HttpSession session = RequestFactory.createBarkingSession();
        long lastAccessed = session.getLastAccessedTime();

        checkBarking(session);

        checkCreationTime(session, start);

        checkMaxInactive(session);

        long[] previousLastAccessedHolder = { lastAccessed };
        checkAttributes(session, previousLastAccessedHolder);

        checkInvalidate(session);

        checkUnsupported(session);

        if (errorCount == 0) {
            System.out.println("Success! No errors");
        }
    }

    private static void checkId() {
        int count = 1000;
        Collection<String> ids = new HashSet<String>();
        for (int i = 0; i < count; i++) {
            ids.add(RequestFactory.createBarkingSession().getId());
        }
        if (ids.size() != count) {
            error("at least one non-unique id");
        }
    }

    private static void checkUnsupported(HttpSession session) {
        try {
            session.isNew();
            error("calling an unsupported method should not have worked");
        }
        catch (UnsupportedOperationException expected) {
            // ok
        }
    }

    private static void checkInvalidate(HttpSession session) {
        session.invalidate();
        if (session.getAttributeNames() != null) {
            error("There should be no attributes after invalidate");
        }

        Date now = new Date();
        session.setAttribute("when", now);
        if (now.equals(session.getAttribute("when"))) {
            error("set attribute shouldn't work after invalidate");
        }
    }

    private static void checkAttributes(HttpSession session, long[] previousLastAccessedHolder) {
        if (previousLastAccessedHolder[0] != session.getLastAccessedTime()) {
            error("last accessed shouldn't have changed");
        }

        if (session.getAttributeNames().hasMoreElements()) {
            error("There should be no attributes initially");
        }

        if (previousLastAccessedHolder[0] == session.getLastAccessedTime()) {
            error("last accessed should have changed");
        }

        session.setAttribute("answer", 42);
        if (!session.getAttribute("answer").equals(42)) {
            error("get attribute doesn't return the set value");
        }
        checkAttributeNames(session, "answer");

        if (previousLastAccessedHolder[0] == session.getLastAccessedTime()) {
            error("last accessed should have changed");
        }
        previousLastAccessedHolder[0] = session.getLastAccessedTime();

        Date now = new Date();
        session.setAttribute("when", now);
        if (!session.getAttribute("when").equals(now)) {
            error("get attribute doesn't return the set value");
        }
        checkAttributeNames(session, "answer", "when");
        if (previousLastAccessedHolder[0] == session.getLastAccessedTime()) {
            error("last accessed should have changed");
        }
        if (previousLastAccessedHolder[0] > session.getLastAccessedTime()) {
            error("last accessed should be increasing");
        }

        session.removeAttribute("answer");
        if (session.getAttribute("answer") != null) {
            error("returning a value for a removed key");
        }
        checkAttributeNames(session, "when");
    }

    private static void checkMaxInactive(HttpSession session) {
        int maxInactive = 12345;
        session.setMaxInactiveInterval(maxInactive);
        if (session.getMaxInactiveInterval() != maxInactive) {
            error("max inactive get doesn't return the set value");
        }
    }

    private static void checkCreationTime(HttpSession session, long start) {
        long creationTime = session.getCreationTime();
        if (creationTime < start) {
            error("session created in the past");
        }
        else if (creationTime - start > 2000) {
            error("session created in the future");
        }
    }

    private static void checkBarking(HttpSession session) {
        if (session instanceof RequestFactory.Barking) {
            ((RequestFactory.Barking)session).bark();
        }
        else {
            error("session doesn't implement Barking");
        }
    }

    private static void error(String message) {
        System.out.println("Error: " + message);
        errorCount++;
    }

    private static Set<String> attrNames(HttpSession session) {
        Set<String> names = new HashSet<String>();
        Enumeration<String> e = session.getAttributeNames();
        while (e.hasMoreElements()) {
            names.add(e.nextElement());
        }
        return names;
    };

    private static void checkAttributeNames(HttpSession session, String... expectedNames) {
        List<String> expected = new ArrayList<String>(Arrays.asList(expectedNames));
        Collections.sort(expected);

        List<String> observed = new ArrayList<String>(attrNames(session));
        Collections.sort(observed);

        if (!expected.equals(observed)) {
            error("Bad session attribute names; expected '" + expected + "' but saw '" + observed + "'");
        }
    }
}
