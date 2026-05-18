package com.example.employee.util;

import java.util.regex.Pattern;

/**
 * Official EAC employee number assigned by HR (format {@code 1-00001}: campus prefix + 5-digit sequence).
 */
public final class EacEmployeeIdUtil {

    private static final Pattern FORMAT = Pattern.compile("^[0-9]+-[0-9]{5}$");

    private EacEmployeeIdUtil() {}

    public static String normalize(String raw) {
        if (raw == null) {
            return null;
        }
        return raw.trim();
    }

    public static boolean isValidFormat(String normalized) {
        return normalized != null && !normalized.isBlank() && FORMAT.matcher(normalized).matches();
    }

    public static String requireValid(String raw) {
        String id = normalize(raw);
        if (!isValidFormat(id)) {
            throw new IllegalArgumentException(
                "EAC Employee ID must match the format 1-00001 (campus number, hyphen, 5 digits).");
        }
        return id;
    }
}
