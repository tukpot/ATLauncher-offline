/*
 * ATLauncher - https://github.com/ATLauncher/ATLauncher
 * Copyright (C) 2013-2022 ATLauncher
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */
package com.atlauncher.data;

import java.util.List;

import com.google.gson.annotations.SerializedName;

/**
 * Minimal representation of a GitHub "release" object, used by this fork to self-update from its
 * own GitHub releases instead of ATLauncher's servers.
 *
 * @see <a href="https://docs.github.com/en/rest/releases/releases">GitHub Releases API</a>
 */
public class GitHubRelease {
    @SerializedName("tag_name")
    public String tagName;

    public String name;

    public boolean draft;

    public boolean prerelease;

    public List<Asset> assets;

    public static class Asset {
        public String name;

        public long size;

        @SerializedName("browser_download_url")
        public String browserDownloadUrl;
    }
}
