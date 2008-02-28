class ProfileDesignController < BoxOrganizerController

  needs_profile

  protect 'edit_profile_design', :profile
  
  def available_blocks
    blocks = [ ArticleBlock, TagsBlock, RecentDocumentsBlock, ProfileInfoBlock ]

    # blocks exclusive for organizations
    if profile.has_members?
      blocks << MembersBlock
    end

    if profile.person?
      blocks << FriendsBlock
    end

    blocks
  end

end
