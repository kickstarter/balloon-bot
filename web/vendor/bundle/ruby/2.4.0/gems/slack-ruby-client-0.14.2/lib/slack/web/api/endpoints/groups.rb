# This file was auto-generated by lib/tasks/web.rake

module Slack
  module Web
    module Api
      module Endpoints
        module Groups
          #
          # This method archives a private channel.
          #
          # @option options [group] :channel
          #   Private channel to archive.
          # @see https://api.slack.com/methods/groups.archive
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/groups/groups.archive.json
          def groups_archive(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            options = options.merge(channel: groups_id(options)['group']['id']) if options[:channel]
            post('groups.archive', options)
          end

          #
          # This method creates a private channel.
          #
          # @option options [Object] :name
          #   Name of private channel to create.
          # @option options [Object] :validate
          #   Whether to return errors on invalid channel name instead of modifying it to meet the specified criteria.
          # @see https://api.slack.com/methods/groups.create
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/groups/groups.create.json
          def groups_create(options = {})
            throw ArgumentError.new('Required arguments :name missing') if options[:name].nil?
            post('groups.create', options)
          end

          #
          # This method takes an existing private channel and performs the following steps:
          #
          # @option options [group] :channel
          #   Private channel to clone and archive.
          # @see https://api.slack.com/methods/groups.createChild
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/groups/groups.createChild.json
          def groups_createChild(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            options = options.merge(channel: groups_id(options)['group']['id']) if options[:channel]
            post('groups.createChild', options)
          end

          #
          # This method returns a portion of messages/events from the specified private channel.
          # To read the entire history for a private channel, call the method with no latest or
          # oldest arguments, and then continue paging using the instructions below.
          #
          # @option options [group] :channel
          #   Private channel to fetch history for.
          # @option options [Object] :inclusive
          #   Include messages with latest or oldest timestamp in results.
          # @option options [timestamp] :latest
          #   End of time range of messages to include in results.
          # @option options [timestamp] :oldest
          #   Start of time range of messages to include in results.
          # @option options [Object] :unreads
          #   Include unread_count_display in the output?.
          # @see https://api.slack.com/methods/groups.history
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/groups/groups.history.json
          def groups_history(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            options = options.merge(channel: groups_id(options)['group']['id']) if options[:channel]
            post('groups.history', options)
          end

          #
          # Don't use this method. Use conversations.info instead.
          #
          # @option options [group] :channel
          #   Private channel to get info on.
          # @option options [Object] :include_locale
          #   Set this to true to receive the locale for this group. Defaults to false.
          # @see https://api.slack.com/methods/groups.info
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/groups/groups.info.json
          def groups_info(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            options = options.merge(channel: groups_id(options)['group']['id']) if options[:channel]
            post('groups.info', options)
          end

          #
          # This method is used to invite a user to a private channel. The calling user must be a member of the private channel.
          #
          # @option options [group] :channel
          #   Private channel to invite user to.
          # @option options [user] :user
          #   User to invite.
          # @see https://api.slack.com/methods/groups.invite
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/groups/groups.invite.json
          def groups_invite(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            throw ArgumentError.new('Required arguments :user missing') if options[:user].nil?
            options = options.merge(channel: groups_id(options)['group']['id']) if options[:channel]
            options = options.merge(user: users_id(options)['user']['id']) if options[:user]
            post('groups.invite', options)
          end

          #
          # This method allows a user to remove another member from a private channel.
          #
          # @option options [group] :channel
          #   Private channel to remove user from.
          # @option options [user] :user
          #   User to remove from private channel.
          # @see https://api.slack.com/methods/groups.kick
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/groups/groups.kick.json
          def groups_kick(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            throw ArgumentError.new('Required arguments :user missing') if options[:user].nil?
            options = options.merge(channel: groups_id(options)['group']['id']) if options[:channel]
            options = options.merge(user: users_id(options)['user']['id']) if options[:user]
            post('groups.kick', options)
          end

          #
          # This method is used to leave a private channel.
          #
          # @option options [group] :channel
          #   Private channel to leave.
          # @see https://api.slack.com/methods/groups.leave
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/groups/groups.leave.json
          def groups_leave(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            options = options.merge(channel: groups_id(options)['group']['id']) if options[:channel]
            post('groups.leave', options)
          end

          #
          # Don't use this method. Use conversations.list instead.
          #
          # @option options [Object] :cursor
          #   Parameter for pagination. Set cursor equal to the next_cursor attribute returned by the previous request's response_metadata. This parameter is optional, but pagination is mandatory: the default value simply fetches the first "page" of the collection. See pagination for more details.
          # @option options [Object] :exclude_archived
          #   Don't return archived private channels.
          # @option options [Object] :exclude_members
          #   Exclude the members from each group.
          # @option options [Object] :limit
          #   The maximum number of items to return. Fewer than the requested number of items may be returned, even if the end of the list hasn't been reached.
          # @see https://api.slack.com/methods/groups.list
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/groups/groups.list.json
          def groups_list(options = {})
            if block_given?
              Pagination::Cursor.new(self, :groups_list, options).each do |page|
                yield page
              end
            else
              post('groups.list', options)
            end
          end

          #
          # This method moves the read cursor in a private channel.
          #
          # @option options [group] :channel
          #   Private channel to set reading cursor in.
          # @option options [timestamp] :ts
          #   Timestamp of the most recently seen message.
          # @see https://api.slack.com/methods/groups.mark
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/groups/groups.mark.json
          def groups_mark(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            throw ArgumentError.new('Required arguments :ts missing') if options[:ts].nil?
            options = options.merge(channel: groups_id(options)['group']['id']) if options[:channel]
            post('groups.mark', options)
          end

          #
          # This method opens a private channel.
          #
          # @option options [group] :channel
          #   Private channel to open.
          # @see https://api.slack.com/methods/groups.open
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/groups/groups.open.json
          def groups_open(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            options = options.merge(channel: groups_id(options)['group']['id']) if options[:channel]
            post('groups.open', options)
          end

          #
          # This method renames a private channel.
          #
          # @option options [group] :channel
          #   Private channel to rename.
          # @option options [Object] :name
          #   New name for private channel.
          # @option options [Object] :validate
          #   Whether to return errors on invalid channel name instead of modifying it to meet the specified criteria.
          # @see https://api.slack.com/methods/groups.rename
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/groups/groups.rename.json
          def groups_rename(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            throw ArgumentError.new('Required arguments :name missing') if options[:name].nil?
            options = options.merge(channel: groups_id(options)['group']['id']) if options[:channel]
            post('groups.rename', options)
          end

          #
          # This method returns an entire thread (a message plus all the messages in reply to it).
          #
          # @option options [group] :channel
          #   Private channel to fetch thread from.
          # @option options [Object] :thread_ts
          #   Unique identifier of a thread's parent message.
          # @see https://api.slack.com/methods/groups.replies
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/groups/groups.replies.json
          def groups_replies(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            throw ArgumentError.new('Required arguments :thread_ts missing') if options[:thread_ts].nil?
            options = options.merge(channel: groups_id(options)['group']['id']) if options[:channel]
            post('groups.replies', options)
          end

          #
          # This method is used to change the purpose of a private channel. The calling user must be a member of the private channel.
          #
          # @option options [group] :channel
          #   Private channel to set the purpose of.
          # @option options [Object] :purpose
          #   The new purpose.
          # @see https://api.slack.com/methods/groups.setPurpose
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/groups/groups.setPurpose.json
          def groups_setPurpose(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            throw ArgumentError.new('Required arguments :purpose missing') if options[:purpose].nil?
            options = options.merge(channel: groups_id(options)['group']['id']) if options[:channel]
            post('groups.setPurpose', options)
          end

          #
          # This method is used to change the topic of a private channel. The calling user must be a member of the private channel.
          #
          # @option options [group] :channel
          #   Private channel to set the topic of.
          # @option options [Object] :topic
          #   The new topic.
          # @see https://api.slack.com/methods/groups.setTopic
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/groups/groups.setTopic.json
          def groups_setTopic(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            throw ArgumentError.new('Required arguments :topic missing') if options[:topic].nil?
            options = options.merge(channel: groups_id(options)['group']['id']) if options[:channel]
            post('groups.setTopic', options)
          end

          #
          # This method unarchives a private channel.
          #
          # @option options [group] :channel
          #   Private channel to unarchive.
          # @see https://api.slack.com/methods/groups.unarchive
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/groups/groups.unarchive.json
          def groups_unarchive(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            options = options.merge(channel: groups_id(options)['group']['id']) if options[:channel]
            post('groups.unarchive', options)
          end
        end
      end
    end
  end
end
