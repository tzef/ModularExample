//
//  GithubSearchResponse.swift
//  ModuleListing
//

import Foundation

struct GithubSearchResponse: Decodable {
    var totalCount: Int
    var incompleteResults: Bool
    var items: [Item]

    struct Item: Decodable {
        var id: Int
        var nodeId: String?
        var name: String?
        var fullName: String?
        var isPrivate: Bool?
        var htmlUrl: String?
        var description: String?
        var fork: Bool?
        var url: String?
        var createdAt: Date?
        var updatedAt: Date?
        var pushedAt: Date?
        var homepage: String?
        var size: Int?
        var stargazersCount: Int?
        var watchersCount: Int?
        var language: String?
        var forksCount: Int?
        var openIssuesCount: Int?
        var masterBranch: String?
        var defaultBranch: String?
        var score: Int?
        var archiveUrl: String?
        var assigneesUrl: String?
        var blobsUrl: String?
        var branchesUrl: String?
        var collaboratorsUrl: String?
        var commentsUrl: String?
        var commitsUrl: String?
        var compareUrl: String?
        var contentsUrl: String?
        var contributorsUrl: String?
        var deploymentsUrl: String?
        var downloadsUrl: String?
        var eventsUrl: String?
        var forksUrl: String?
        var gitCommitsUrl: String?
        var gitRefsUrl: String?
        var gitTagsUrl: String?
        var gitUrl: String?
        var issue_commentUrl: String?
        var issue_eventsUrl: String?
        var issuesUrl: String?
        var keysUrl: String?
        var labelsUrl: String?
        var languagesUrl: String?
        var mergesUrl: String?
        var milestonesUrl: String?
        var notificationsUrl: String?
        var pullsUrl: String?
        var releasesUrl: String?
        var sshUrl: String?
        var stargazersUrl: String?
        var statusesUrl: String?
        var subscribersUrl: String?
        var subscriptionUrl: String?
        var tagsUrl: String?
        var teamsUrl: String?
        var treesUrl: String?
        var cloneUrl: String?
        var mirrorUrl: String?
        var hooksUrl: String?
        var svnUrl: String?
        var forks: Int?
        var openIssues: Int?
        var watchers: Int?
        var hasIssues: Bool?
        var hasProjects: Bool?
        var hasPages: Bool?
        var hasWiki: Bool?
        var hasDownloads: Bool?
        var archived: Bool?
        var disabled: Bool?
        var visibility: String?
        var license: License?
        var owner: Owner

        struct License: Decodable {
            var key: String?
            var name: String?
            var url: String?
            var spdxId: String?
            var nodeId: String?
            var htmlUrl: String?

            private enum CodingKeys:  String, CodingKey {
                case key
                case name
                case url
                case spdxId = "spdx_id"
                case nodeId = "node_id"
                case htmlUrl = "html_url"
            }
        }

        struct Owner: Decodable {
            var id: Int
            var login: String?
            var nodeId: String?
            var avatarUrl: String?
            var gravatarId: String?
            var url: String?
            var receivedEventsUrl: String?
            var type: String?
            var htmlUrl: String?
            var followersUrl: String?
            var followingUrl: String?
            var gistsUrl: String?
            var starredUrl: String?
            var subscriptionsUrl: String?
            var organizationsUrl: String?
            var reposUrl: String?
            var eventsUrl: String?
            var siteAdmin: Bool?

            private enum CodingKeys: String, CodingKey {
                case id = "id"
                case login = "login"
                case nodeId = "node_id"
                case avatarUrl = "avatar_url"
                case gravatarId = "gravatar_id"
                case url = "url"
                case receivedEventsUrl = "received_events_url"
                case type = "type"
                case htmlUrl = "html_url"
                case followersUrl = "followers_url"
                case followingUrl = "following_url"
                case gistsUrl = "gists_url"
                case starredUrl = "starred_url"
                case subscriptionsUrl = "subscriptions_url"
                case organizationsUrl = "organizations_url"
                case reposUrl = "repos_url"
                case eventsUrl = "events_url"
                case siteAdmin = "site_admin"
            }
        }

        private enum CodingKeys:  String, CodingKey {
            case id
            case nodeId = "node_id"
            case name
            case fullName = "full_name"
            case isPrivate = "private"
            case htmlUrl = "html_url"
            case description
            case fork
            case url
            case createdAt = "created_at"
            case updatedAt = "updated_at"
            case pushedAt = "pushed_at"
            case homepage
            case size
            case stargazersCount = "stargazers_count"
            case watchersCount = "watchers_count"
            case language
            case forksCount = "forks_count"
            case openIssuesCount = "open_issues_count"
            case masterBranch = "master_branch"
            case defaultBranch = "default_branch"
            case score
            case archiveUrl = "archive_url"
            case assigneesUrl = "assignees_url"
            case blobsUrl = "blobs_url"
            case branchesUrl = "branches_url"
            case collaboratorsUrl = "collaborators_url"
            case commentsUrl = "comments_url"
            case commitsUrl = "commits_url"
            case compareUrl = "compare_url"
            case contentsUrl = "contents_url"
            case contributorsUrl = "contributors_url"
            case deploymentsUrl = "deployments_url"
            case downloadsUrl = "downloads_url"
            case eventsUrl = "events_url"
            case forksUrl = "forks_url"
            case gitCommitsUrl = "git_commits_url"
            case gitRefsUrl = "git_refs_url"
            case gitTagsUrl = "git_tags_url"
            case gitUrl = "git_url"
            case issue_commentUrl = "issue_comment_url"
            case issue_eventsUrl = "issue_events_url"
            case issuesUrl = "issues_url"
            case keysUrl = "keys_url"
            case labelsUrl = "labels_url"
            case languagesUrl = "languages_url"
            case mergesUrl = "merges_url"
            case milestonesUrl = "milestones_url"
            case notificationsUrl = "notifications_url"
            case pullsUrl = "pulls_url"
            case releasesUrl = "releases_url"
            case sshUrl = "ssh_url"
            case stargazersUrl = "stargazers_url"
            case statusesUrl = "statuses_url"
            case subscribersUrl = "subscribers_url"
            case subscriptionUrl = "subscription_url"
            case tagsUrl = "tags_url"
            case teamsUrl = "teams_url"
            case treesUrl = "trees_url"
            case cloneUrl = "clone_url"
            case mirrorUrl = "mirror_url"
            case hooksUrl = "hooks_url"
            case svnUrl = "svn_url"
            case forks
            case openIssues = "open_issues"
            case watchers
            case hasIssues = "has_issues"
            case hasProjects = "has_projects"
            case hasPages = "has_pages"
            case hasWiki = "has_wiki"
            case hasDownloads = "has_downloads"
            case archived
            case disabled
            case visibility
            case license
            case owner
        }
    }

    private enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}
