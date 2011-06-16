package br.eng.mosaic.pigeon.common.dto;

public class UserSocialInfo extends UserInfo {
	
	public String social_id;
	public String oauth_token;
	
	
	
	public UserSocialInfo(String name, String email, String oauth_token) {
		super(name, email, oauth_token);
		this.oauth_token = oauth_token;
	}	

}