Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BDBE1C13
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 23 Oct 2019 15:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EABB26EA9B;
	Wed, 23 Oct 2019 13:15:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C62246EA9B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 23 Oct 2019 13:15:49 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id k20so12162331pgi.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 23 Oct 2019 06:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:references:in-reply-to:subject:date
 :message-id:mime-version:thread-index:content-language
 :disposition-notification-to;
 bh=z/J/j/g6ErJ92Ci97AnYu1di2SzOTtWDej49jZgDWW8=;
 b=qdZoNe0YVgW1JCOaKou0jXgnsX2RK0ZR9vCRWv817+36adzFqi+ZjzL9ll+EItjpit
 MS5xH1HunoYkZYPqbf3+5Xixz1n8hf0pY5hW8qon+fEp/8xp+VY4SiwGDUGb88/9rB/3
 haX3IZyD0Ejql05HIoYaI18uc4sf5EG+nrejbh/iQfxH+qxKhRkuvVa3VbrNuz5V9/im
 4EgpnTUJlt6LoVNwjpJiLiwTgHpGtzt+KX3Hdclz+afXfkpOAexUpclHh6SeINWcqgW6
 kJ4fKqAMtaCtvZ0eoBKoJFejDHXjRlPTG36NmQmYK1CnEZhCQzxBixW6QPksH8TJ0NL5
 +BNQ==
X-Gm-Message-State: APjAAAUjlyR7/yoQGTky5Qq8sQ48MNjQ63kmsmgoXxkQdooVI46k6pzv
 wBoUYLSQdPGmcu+mRbGjgC80ahOYETs=
X-Google-Smtp-Source: APXvYqwjKwkkULbXg7O+HFK6EffkF9xI6iud6gy4WRXRp+aFX+rXy612El+rILdPGTuZ7v3E6Aa2rg==
X-Received: by 2002:a17:90a:c244:: with SMTP id
 d4mr3396787pjx.117.1571836548986; 
 Wed, 23 Oct 2019 06:15:48 -0700 (PDT)
Received: from SNBS17 ([183.82.16.76])
 by smtp.gmail.com with ESMTPSA id a11sm24749367pfg.94.2019.10.23.06.15.46
 for <intel-gvt-dev@lists.freedesktop.org>
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 23 Oct 2019 06:15:48 -0700 (PDT)
From: "Angela Wang" <angela@technologydatahub.com>
To: <intel-gvt-dev@lists.freedesktop.org>
References: 
In-Reply-To: 
Subject: RE: 10Gen
Date: Wed, 23 Oct 2019 09:13:39 -0400
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAACr8CvNeCztNrsWvpezUrLLCgAAAEAAAAJj6bsXByZRMv4pQOF2C25gBAAAAAA==@technologydatahub.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AdWI+JnpU1/mjnnuQleI/lUBctxDkQAqlx5g
Content-Language: en-us
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=technologydatahub-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:references:in-reply-to:subject:date:message-id:mime-version
 :thread-index:content-language:disposition-notification-to;
 bh=z/J/j/g6ErJ92Ci97AnYu1di2SzOTtWDej49jZgDWW8=;
 b=A/RFGGjr+SCY60HWfrBztoM3QoeYuwDS0FUa79tZtgeAHOndeMEM4ukxkQs+8N9GqZ
 eDYDF7GEDGupBJL14TW09X7Mit+llVFAipQ8zDSwWKH7eoolznexlg0FOXGdStVtpxjb
 /dfD7eJo4SecfoFLInDuNDRF8yiwsC4U/tRpRAmMqYr1z1/VG5glpBtaCoOPcJtbnOxw
 fzbMHjzVCv2c4ywnPuBpFuKxXpvWZD6xSDZMi9N6sEznVrhaphMrouPNCt5mD0Nhizen
 J99MkLuelu0FtMxSn6G31UMgEE+K0+h/WuQyNwN/CvWlkUGl8gqTGhZNygDsgp8dH1py
 Seag==
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0143804516=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

This is a multipart message in MIME format.

--===============0143804516==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0362_01D58982.A348AAE0"
Content-Language: en-us

This is a multipart message in MIME format.

------=_NextPart_000_0362_01D58982.A348AAE0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,
 
Can you let me know what type of Technology User are you looking for?
 
Target Technology: 
Target Geography:
 
Regards,
-Angela
 
From: Angela Wang [mailto:angela@technologydatahub.com] 
Sent: Tuesday, October 22, 2019 12:49 PM
To: 'intel-gvt-dev@lists.freedesktop.org'
Subject: 10Gen
 
Hi,
 
I would like to know if you are interested in acquiring a list of customers
that use 10Gen Software Users.
 
Our data file contains 15plus points with Email address, Contact Numbers and
Contact profiles.
 
We do have decision maker's data from Industry like: Manufacturing and
Logistics, Retail, Healthcare, Media and Entertainment and
Telecommunication.
 
Please let me know If you like to see sample file as per your requirements.
 
Note: - As per your requirement, I can break down the list.
 
---
 
Thanking you,
Angela Wang.
Manager | Demand Generation
 
Note: Before saying no to our product please check the quality and quantity
of our product.
 

------=_NextPart_000_0362_01D58982.A348AAE0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii"><meta name=3DProgId content=3DWord.Document><meta =
name=3DGenerator content=3D"Microsoft Word 15"><meta name=3DOriginator =
content=3D"Microsoft Word 15"><link rel=3DFile-List =
href=3D"cid:filelist.xml@01D58981.6F6EB350"><!--[if gte mso 9]><xml>
<o:OfficeDocumentSettings>
<o:AllowPNG/>
</o:OfficeDocumentSettings>
</xml><![endif]--><link rel=3DthemeData href=3D"~~themedata~~"><link =
rel=3DcolorSchemeMapping href=3D"~~colorschememapping~~"><!--[if gte mso =
9]><xml>
<w:WordDocument>
<w:View>Normal</w:View>
<w:Zoom>96</w:Zoom>
<w:TrackMoves/>
<w:TrackFormatting/>
<w:EnvelopeVis/>
<w:ValidateAgainstSchemas/>
<w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
<w:IgnoreMixedContent>false</w:IgnoreMixedContent>
<w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
<w:DoNotPromoteQF/>
<w:LidThemeOther>EN-US</w:LidThemeOther>
<w:LidThemeAsian>X-NONE</w:LidThemeAsian>
<w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
<w:Compatibility>
<w:DoNotExpandShiftReturn/>
<w:BreakWrappedTables/>
<w:SplitPgBreakAndParaMark/>
<w:EnableOpenTypeKerning/>
</w:Compatibility>
<w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>
<m:mathPr>
<m:mathFont m:val=3D"Cambria Math"/>
<m:brkBin m:val=3D"before"/>
<m:brkBinSub m:val=3D"&#45;-"/>
<m:smallFrac m:val=3D"off"/>
<m:dispDef/>
<m:lMargin m:val=3D"0"/>
<m:rMargin m:val=3D"0"/>
<m:defJc m:val=3D"centerGroup"/>
<m:wrapIndent m:val=3D"1440"/>
<m:intLim m:val=3D"subSup"/>
<m:naryLim m:val=3D"undOvr"/>
</m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
<w:LatentStyles DefLockedState=3D"false" DefUnhideWhenUsed=3D"false" =
DefSemiHidden=3D"false" DefQFormat=3D"false" DefPriority=3D"99" =
LatentStyleCount=3D"371">
<w:LsdException Locked=3D"false" Priority=3D"0" QFormat=3D"true" =
Name=3D"Normal"/>
<w:LsdException Locked=3D"false" Priority=3D"9" QFormat=3D"true" =
Name=3D"heading 1"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 2"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 3"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 4"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 5"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 6"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 7"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 8"/>
<w:LsdException Locked=3D"false" Priority=3D"9" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"heading 9"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"index 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"index 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"index 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"index 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"index 5"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"index 6"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"index 7"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"index 8"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"index 9"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"toc 1"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"toc 2"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"toc 3"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"toc 4"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"toc 5"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"toc 6"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"toc 7"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"toc 8"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"toc 9"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Normal Indent"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"footnote text"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"annotation text"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"header"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"footer"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"index heading"/>
<w:LsdException Locked=3D"false" Priority=3D"35" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"caption"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"table of figures"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"envelope address"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"envelope return"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"footnote reference"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"annotation reference"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"line number"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"page number"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"endnote reference"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"endnote text"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"table of authorities"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"macro"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"toa heading"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Bullet"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Number"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List 5"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Bullet 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Bullet 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Bullet 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Bullet 5"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Number 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Number 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Number 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Number 5"/>
<w:LsdException Locked=3D"false" Priority=3D"10" QFormat=3D"true" =
Name=3D"Title"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Closing"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Signature"/>
<w:LsdException Locked=3D"false" Priority=3D"1" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Default Paragraph Font"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Body Text"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Body Text Indent"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Continue"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Continue 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Continue 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Continue 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"List Continue 5"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Message Header"/>
<w:LsdException Locked=3D"false" Priority=3D"11" QFormat=3D"true" =
Name=3D"Subtitle"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Salutation"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Date"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Body Text First Indent"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Body Text First Indent 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Note Heading"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Body Text 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Body Text 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Body Text Indent 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Body Text Indent 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Block Text"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Hyperlink"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"FollowedHyperlink"/>
<w:LsdException Locked=3D"false" Priority=3D"22" QFormat=3D"true" =
Name=3D"Strong"/>
<w:LsdException Locked=3D"false" Priority=3D"20" QFormat=3D"true" =
Name=3D"Emphasis"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Document Map"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Plain Text"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"E-mail Signature"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"HTML Top of Form"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"HTML Bottom of Form"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Normal (Web)"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"HTML Acronym"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"HTML Address"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"HTML Cite"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"HTML Code"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"HTML Definition"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"HTML Keyboard"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"HTML Preformatted"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"HTML Sample"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"HTML Typewriter"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"HTML Variable"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Normal Table"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"annotation subject"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"No List"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Outline List 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Outline List 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Outline List 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Simple 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Simple 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Simple 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Classic 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Classic 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Classic 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Classic 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Colorful 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Colorful 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Colorful 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Columns 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Columns 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Columns 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Columns 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Columns 5"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Grid 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Grid 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Grid 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Grid 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Grid 5"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Grid 6"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Grid 7"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Grid 8"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table List 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table List 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table List 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table List 4"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table List 5"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table List 6"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table List 7"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table List 8"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table 3D effects 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table 3D effects 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table 3D effects 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Contemporary"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Elegant"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Professional"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Subtle 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Subtle 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Web 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Web 2"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Web 3"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Balloon Text"/>
<w:LsdException Locked=3D"false" Priority=3D"39" Name=3D"Table Grid"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Table Theme"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" Name=3D"Placeholder =
Text"/>
<w:LsdException Locked=3D"false" Priority=3D"1" QFormat=3D"true" =
Name=3D"No Spacing"/>
<w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light =
Shading"/>
<w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List"/>
<w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid"/>
<w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading =
1"/>
<w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading =
2"/>
<w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List =
1"/>
<w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List =
2"/>
<w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid =
1"/>
<w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid =
2"/>
<w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid =
3"/>
<w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List"/>
<w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful =
Shading"/>
<w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful =
List"/>
<w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful =
Grid"/>
<w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading =
1 Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading =
2 Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 =
Accent 1"/>
<w:LsdException Locked=3D"false" SemiHidden=3D"true" Name=3D"Revision"/>
<w:LsdException Locked=3D"false" Priority=3D"34" QFormat=3D"true" =
Name=3D"List Paragraph"/>
<w:LsdException Locked=3D"false" Priority=3D"29" QFormat=3D"true" =
Name=3D"Quote"/>
<w:LsdException Locked=3D"false" Priority=3D"30" QFormat=3D"true" =
Name=3D"Intense Quote"/>
<w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful =
Shading Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading =
1 Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading =
2 Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful =
Shading Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading =
1 Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading =
2 Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful =
Shading Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading =
1 Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading =
2 Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful =
Shading Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading =
1 Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading =
2 Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful =
Shading Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"60" Name=3D"Light Shading =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"61" Name=3D"Light List =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"62" Name=3D"Light Grid =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"63" Name=3D"Medium Shading =
1 Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"64" Name=3D"Medium Shading =
2 Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"65" Name=3D"Medium List 1 =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"66" Name=3D"Medium List 2 =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"67" Name=3D"Medium Grid 1 =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"68" Name=3D"Medium Grid 2 =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"69" Name=3D"Medium Grid 3 =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"70" Name=3D"Dark List =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"71" Name=3D"Colorful =
Shading Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"72" Name=3D"Colorful List =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"73" Name=3D"Colorful Grid =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"19" QFormat=3D"true" =
Name=3D"Subtle Emphasis"/>
<w:LsdException Locked=3D"false" Priority=3D"21" QFormat=3D"true" =
Name=3D"Intense Emphasis"/>
<w:LsdException Locked=3D"false" Priority=3D"31" QFormat=3D"true" =
Name=3D"Subtle Reference"/>
<w:LsdException Locked=3D"false" Priority=3D"32" QFormat=3D"true" =
Name=3D"Intense Reference"/>
<w:LsdException Locked=3D"false" Priority=3D"33" QFormat=3D"true" =
Name=3D"Book Title"/>
<w:LsdException Locked=3D"false" Priority=3D"37" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" Name=3D"Bibliography"/>
<w:LsdException Locked=3D"false" Priority=3D"39" SemiHidden=3D"true" =
UnhideWhenUsed=3D"true" QFormat=3D"true" Name=3D"TOC Heading"/>
<w:LsdException Locked=3D"false" Priority=3D"41" Name=3D"Plain Table =
1"/>
<w:LsdException Locked=3D"false" Priority=3D"42" Name=3D"Plain Table =
2"/>
<w:LsdException Locked=3D"false" Priority=3D"43" Name=3D"Plain Table =
3"/>
<w:LsdException Locked=3D"false" Priority=3D"44" Name=3D"Plain Table =
4"/>
<w:LsdException Locked=3D"false" Priority=3D"45" Name=3D"Plain Table =
5"/>
<w:LsdException Locked=3D"false" Priority=3D"40" Name=3D"Grid Table =
Light"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 =
Light"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 =
Dark"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 =
Colorful"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 =
Colorful"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 =
Light Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 =
Dark Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 =
Colorful Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 =
Colorful Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 =
Light Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 =
Dark Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 =
Colorful Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 =
Colorful Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 =
Light Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 =
Dark Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 =
Colorful Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 =
Colorful Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 =
Light Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 =
Dark Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 =
Colorful Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 =
Colorful Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 =
Light Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 =
Dark Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 =
Colorful Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 =
Colorful Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"Grid Table 1 =
Light Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"Grid Table 2 =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"Grid Table 3 =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"Grid Table 4 =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"Grid Table 5 =
Dark Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"Grid Table 6 =
Colorful Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"Grid Table 7 =
Colorful Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 =
Light"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 =
Dark"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 =
Colorful"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 =
Colorful"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 =
Light Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 =
Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 =
Dark Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 =
Colorful Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 =
Colorful Accent 1"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 =
Light Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 =
Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 =
Dark Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 =
Colorful Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 =
Colorful Accent 2"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 =
Light Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 =
Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 =
Dark Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 =
Colorful Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 =
Colorful Accent 3"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 =
Light Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 =
Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 =
Dark Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 =
Colorful Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 =
Colorful Accent 4"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 =
Light Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 =
Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 =
Dark Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 =
Colorful Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 =
Colorful Accent 5"/>
<w:LsdException Locked=3D"false" Priority=3D"46" Name=3D"List Table 1 =
Light Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"47" Name=3D"List Table 2 =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"48" Name=3D"List Table 3 =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"49" Name=3D"List Table 4 =
Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"50" Name=3D"List Table 5 =
Dark Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"51" Name=3D"List Table 6 =
Colorful Accent 6"/>
<w:LsdException Locked=3D"false" Priority=3D"52" Name=3D"List Table 7 =
Colorful Accent 6"/>
</w:LatentStyles>
</xml><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;
	mso-font-charset:0;
	mso-generic-font-family:roman;
	mso-font-pitch:variable;
	mso-font-signature:-536870145 1107305727 0 0 415 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:-536870145 1073786111 1 0 415 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-unhide:no;
	mso-style-qformat:yes;
	mso-style-parent:"";
	margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-fareast-font-family:Calibri;
	mso-fareast-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{mso-style-noshow:yes;
	mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;
	text-underline:single;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-noshow:yes;
	mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;
	text-underline:single;}
span.EmailStyle17
	{mso-style-type:personal;
	mso-style-noshow:yes;
	mso-style-unhide:no;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-hansi-font-family:Calibri;
	color:windowtext;
	mso-text-animation:none;
	position:relative;
	top:0pt;
	mso-text-raise:0pt;
	letter-spacing:0pt;
	text-decoration:none;
	text-underline:none;
	text-decoration:none;
	text-line-through:none;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	mso-style-noshow:yes;
	mso-style-unhide:no;
	mso-ansi-font-size:11.0pt;
	mso-bidi-font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:Calibri;
	mso-fareast-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-default-props:yes;
	font-size:10.0pt;
	mso-ansi-font-size:10.0pt;
	mso-bidi-font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;
	mso-paper-source:0;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 10]><style>/* Style Definitions */
table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0in 5.4pt 0in 5.4pt;
	mso-para-margin:0in;
	mso-para-margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Times New Roman","serif";}
</style><![endif]--></head><body lang=3DEN-US link=3D"#0563C1" =
vlink=3D"#954F72" style=3D'tab-interval:.5in'><div =
class=3DWordSection1><p class=3DMsoNormal>Hi,<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Can you let =
me know what type of Technology User are you looking =
for?<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Target Technology: <o:p></o:p></p><p =
class=3DMsoNormal>Target Geography:<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Regards,<o:p></o:p></p><p =
class=3DMsoNormal>-Angela<span =
style=3D'mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;m=
so-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;mso-bidi-fo=
nt-family:"Times New =
Roman";mso-bidi-theme-font:minor-bidi;color:#1F497D'><o:p></o:p></span></=
p><p class=3DMsoNormal><span =
style=3D'mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;m=
so-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;mso-bidi-fo=
nt-family:"Times New =
Roman";mso-bidi-theme-font:minor-bidi;color:#1F497D'><o:p>&nbsp;</o:p></s=
pan></p><div><div style=3D'border:none;border-top:solid #E1E1E1 =
1.0pt;padding:3.0pt 0in 0in 0in'><p class=3DMsoNormal><a =
name=3D"_MailOriginal"><b><span style=3D'mso-fareast-font-family:"Times =
New Roman"'>From:</span></b></a><span =
style=3D'mso-bookmark:_MailOriginal'><span =
style=3D'mso-fareast-font-family:"Times New Roman"'> Angela Wang =
[mailto:angela@technologydatahub.com] <br><b>Sent:</b> Tuesday, October =
22, 2019 12:49 PM<br><b>To:</b> =
'intel-gvt-dev@lists.freedesktop.org'<br><b>Subject:</b> =
10Gen<o:p></o:p></span></span></p></div></div><p class=3DMsoNormal><span =
style=3D'mso-bookmark:_MailOriginal'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'mso-bookmark:_MailOriginal'><span =
style=3D'color:#1F4E79'>Hi,<o:p></o:p></span></span></p><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'mso-bookmark:_MailOriginal'><span =
style=3D'color:#1F4E79'><o:p>&nbsp;</o:p></span></span></p><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'mso-bookmark:_MailOriginal'><span style=3D'color:#1F4E79'>I =
would like to know if you are interested in acquiring a list of =
customers that use <b>10Gen Software =
Users.</b><o:p></o:p></span></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span =
style=3D'mso-bookmark:_MailOriginal'><span =
style=3D'color:#1F4E79'><o:p>&nbsp;</o:p></span></span></p><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'mso-bookmark:_MailOriginal'><span style=3D'color:#1F4E79'>Our =
data file contains 15plus points with Email address, Contact Numbers and =
Contact profiles.<o:p></o:p></span></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span =
style=3D'mso-bookmark:_MailOriginal'><span =
style=3D'color:#1F4E79'><o:p>&nbsp;</o:p></span></span></p><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'mso-bookmark:_MailOriginal'><span style=3D'color:#1F4E79'>We do =
have decision maker&#8217;s data from Industry like: <b>Manufacturing =
and Logistics, Retail, Healthcare, Media and Entertainment and =
Telecommunication.</b><o:p></o:p></span></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span =
style=3D'mso-bookmark:_MailOriginal'><span =
style=3D'color:#1F4E79'><o:p>&nbsp;</o:p></span></span></p><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'mso-bookmark:_MailOriginal'><span =
style=3D'color:#1F4E79'>Please let me know If you like to see <b>sample =
file</b> as per your requirements.<o:p></o:p></span></span></p><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'mso-bookmark:_MailOriginal'><span =
style=3D'color:#1F4E79'><o:p>&nbsp;</o:p></span></span></p><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'mso-bookmark:_MailOriginal'><span style=3D'color:#1F4E79'>Note: =
- As per your requirement, I can break down the =
list.<o:p></o:p></span></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span =
style=3D'mso-bookmark:_MailOriginal'><span =
style=3D'color:#1F4E79'><o:p>&nbsp;</o:p></span></span></p><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'mso-bookmark:_MailOriginal'><span =
style=3D'color:#1F4E79'>---<o:p></o:p></span></span></p><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'mso-bookmark:_MailOriginal'><span =
style=3D'color:#1F4E79'><o:p>&nbsp;</o:p></span></span></p><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'mso-bookmark:_MailOriginal'><span =
style=3D'color:#1F4E79'>Thanking you,<o:p></o:p></span></span></p><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'mso-bookmark:_MailOriginal'><b><span =
style=3D'color:#1F4E79'>Angela Wang.<o:p></o:p></span></b></span></p><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'mso-bookmark:_MailOriginal'><span =
style=3D'color:#1F4E79'>Manager | Demand =
Generation<o:p></o:p></span></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span =
style=3D'mso-bookmark:_MailOriginal'><span =
style=3D'color:#1F4E79'><o:p>&nbsp;</o:p></span></span></p><p =
class=3DMsoNormal><span style=3D'mso-bookmark:_MailOriginal'><span =
style=3D'font-size:10.0pt;color:#1F4E79'>Note: Before saying no to our =
product please check the quality and quantity of our =
product.<o:p></o:p></span></span></p><span =
style=3D'mso-bookmark:_MailOriginal'></span><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>
------=_NextPart_000_0362_01D58982.A348AAE0--


--===============0143804516==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0143804516==--

