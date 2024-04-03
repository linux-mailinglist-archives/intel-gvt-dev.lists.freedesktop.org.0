Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4045B8975F1
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  3 Apr 2024 19:07:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1804A10E30A;
	Wed,  3 Apr 2024 17:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="pzplMzkS";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from PUWP216CU001.outbound.protection.outlook.com
 (mail-koreasouthazolkn19010001.outbound.protection.outlook.com [52.103.75.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A96C10E30A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  3 Apr 2024 17:07:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnATK1gY3TC8ur33vUseJnnWt+Dx7nCvDpjPHy2243z45+n4ne+498TtYHnSvCpU18hAKSuRTQsP/Yqx/dXLBv0fgsIwPSioBmwmygOi1KH9oeyK4hSLiS5BjLSeh3JvqWtL4CywaGPxuu8pFR2ZAYybAA/Scg5EVrNel5aF0FWeQcV8JEWX9eEFMgx4dgQcwgz6rnnrqA5HgNTUbbkqukPNjK9gPLzw8UoWUrHsUonSm1aRXa1XH6/J9886nL8pKOcHI8clyVAlTPI+t41Gvx+sCtl7nwvid2Zc1DmEO9lJZC2XBhGOJZCqoUgrHkTpBzM8JUo0GITEZXWyAQbYFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tu27cXiKJ/J34SFaO8rjzjcDsgaHofiU6cfSObiZvYY=;
 b=O5oWspDzH2j0PO1vO9vmU/niOs8MPnelBDjgwcxUH6rj6XRYDYeYN90lS1SkwFWLuE67+YkfIQNK0/ua+kRxvKaov9Dmr1Mj0M4AmNIJcfHDxUd+IQviNu4c82KSSMnEVPoOgqNALEmb+jfXCxxMHNY6LyswV90lrJ8+buQImmPx/mTu2qz1m88MQy0Cx2mz/QpJkcm7axUeDzphz2uxSkbK45hjOEvTWYqLa7b6MMGzzW+YKoml6CBprAD7lIDtYuH4GWMSCxrBObvRc4t0WhyofvPXtscTiA1eVDuRcFI7MuRxSARqxuHB/if3EhsnlkhjLTQoqMfadG4yRV9PCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tu27cXiKJ/J34SFaO8rjzjcDsgaHofiU6cfSObiZvYY=;
 b=pzplMzkS3yhbWAjjggVbjsIcturazfzOjNBTqFAE09eKzlCnggrlDJGvVvPt4Q0wRqxnUiDmwzTdXvpL4XC7FjAFVUhNTnKRBCynB0lYBJFdBGBUKoeiXWzuPUljy/Ao4KzaCoKx2lOWFi5g+W19HY4d1nb4b3jrW5EvkfCAybWa2gOoGBRSp4qC2S7A9Y8YVmK2KxfUAoecl43B12DeXQnqCa82Uaa8Jn9LY+ogQJwr9FSYuR6rSo+pWCD/AW6fOF9Q1mankriXUREJKkmW0IrkLGvsJ9xUo0Sf7oNdfosWF2VuwxJqB8LzwDRgOt+1k9cC+bvagm8diarF0gckSA==
Received: from SE2P216MB1666.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f9::5) by
 SE1P216MB2137.KORP216.PROD.OUTLOOK.COM (2603:1096:101:159::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.46; Wed, 3 Apr 2024 17:07:49 +0000
Received: from SE2P216MB1666.KORP216.PROD.OUTLOOK.COM
 ([fe80::1d2d:b48a:fbc6:d464]) by SE2P216MB1666.KORP216.PROD.OUTLOOK.COM
 ([fe80::1d2d:b48a:fbc6:d464%6]) with mapi id 15.20.7409.042; Wed, 3 Apr 2024
 17:07:49 +0000
From: "=?utf-8?B?ZXFxMjM1MTEyNw==?=" <eqq2351127@hotmail.com>
To: "=?utf-8?B?dGhvbWFzLmthbHRlbmJhY2hlcg==?=" <thomas.kaltenbacher@sbg.ac.at>
Subject: =?utf-8?B?NTYyNTg1NjA4NTkwMzg1Nzg3MjY1MjIx?=
Date: Thu, 04 Apr 2024 01:08:39 +0800
Message-ID: <SE2P216MB1666C81DDA91F56AE269CB3F9B3D2@SE2P216MB1666.KORP216.PROD.OUTLOOK.COM>
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook IMO, Build 9.0.2416 (9.0.2911.0)
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.2180
X-TMN: [m91SAbeZZLKBRIYj0T0bzFLZAx5q+a+u]
X-ClientProxiedBy: SG2PR01CA0136.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::16) To SE2P216MB1666.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:f9::5)
X-Microsoft-Original-Message-ID: <ODIALNCEMJNIPMKEMHGLLFOMJKAB.eqq2351127@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE2P216MB1666:EE_|SE1P216MB2137:EE_
X-MS-Office365-Filtering-Correlation-Id: 39f768d0-59f5-427d-3e2d-08dc54009740
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cnm1L6L0Kd33tZkyO9gSvE8WMddZk0cSAiUMOqHgBZILQIH6rXEqXKBW8+BhkySlYyePi8h/Afhl4oUvZsKnBJtyG+USM2PThBhUgEd5Vr/xiQtKlK0Qi89o57i/ZLkMH7g2pVLoWTthRinLjW5klooWFr70uHNUyUdGpW5F1ipIxm8BiS1+RHs6gzezHL5AH5nW3SxKHM2pVpO3OFDU5HiVbcZKMQkknCW3nRyUH1KGD6DdQq7XKnax9G7PrnVpMHPMgbzIVa9fVL1rSISCggjkvNS3Am9Djq45F1x5GKGEAMxUQWz9cVxc4TFHVqt8+hw18zGZCNXx7lTSuI22ZaA60fPVoiWJUbGXrOgdhqk+ZDuQw8X+c71QvVRl71Q60sKxKQJEzmKToc+/bqFcgGeRdDBiu5N83q/NI2QU6ZnF9IT29gNRlyiKhPeKYoKR93v3PNsp8uFpuQbGNKAfpBxsdHFI5cTnPrlRPdIITSxdQ0dpEdRPRydiGXUGnC+Ekr4QTfH09MqK1b+0HtkHea27MLmjDymzaOqkYZirjeBoGVkJi2obFGv4De9KTWH424rzT1qEM2wwovf2PLPj/qX7D1xNQ9/hpT92wC6i0V3iMMQuJr7xEs9SufQ9bWBadRlwBFKPardxbvWDynNFgoAVWQMFmb9wom8iDp0lEgKrZFWzZE/WeOGKCww69zwv
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWlLYTNHaWpsQTlRN1hoVkdoNFNPOTlrY1h3STNVbkxhNngyS1BFeFV5R3Qw?=
 =?utf-8?B?aHhwL0N4cjBFWUVxUWJQZWRKY3RTTi9TYkgrOGZ3SnNWZ2VINUVTeUJsOXc2?=
 =?utf-8?B?aG1JSTV0bXluc1pOcjZvOUdRN3BINmJIckNKSVIzL3ppVnliakQxV1d0em4w?=
 =?utf-8?B?amtEalkwWnh1NTRsdnNzSDZEVW1ySTY1TG5UNEdnVmFsWU5xVXJ1QzhrRFRq?=
 =?utf-8?B?cmRyOGVHMGpkK201M3dWZENXS1dtWFBsZTgzMi9KajljaTZsVytnZ0ZZeVRU?=
 =?utf-8?B?R0FHdnZLUy93S1FLN1NzRzE5Z0RscUV4OStXK05TL3MwQzh4OGc5SHN2b2h5?=
 =?utf-8?B?THVYd29vRlc3S0EzdFVQRlBzRUdDeHJLMFVvejBXK0h2eGtyRnNhNHNoZWRG?=
 =?utf-8?B?M2tlRnJpRDRZb3huRjF4KzB3bSs1aHJUdkV6WnVZMnU4SVRRNnMzOC9PRWIw?=
 =?utf-8?B?d0E2aHZ6dndFWnNEVFRZNXh1S3V3L1RFZ2twUldMVkN4QzNQcllpQTNDb1ZN?=
 =?utf-8?B?cjY4azhqaGVQWXV6bzFNVDBLVFlNM1lVcUNIcExxZjVHaE1DV2htRTJQUitn?=
 =?utf-8?B?L0I1dUQ4R0ZuZnJIQmNpZEowbE1lNU9oU0lGM1ZiQ2lJKy9VV1VXVFoxSFJZ?=
 =?utf-8?B?aFJRN25WRUZ4SUx1RDIwOVZaTWFWc2RhbVZVVzErVzAybzZFd1BLS0Nsem1i?=
 =?utf-8?B?dFRJdzdqZlZZSkFPbTZEMGpzSndaSk1MUDF6eEpNazdScjVEWUJRbUxwYVZJ?=
 =?utf-8?B?MTVxM1cxTVo2K3B0ZFljVjhPS0NaSk5MeWJZOUNxbFZBdysySHQ1d0doalk4?=
 =?utf-8?B?VzVUc1JUT0RFQmJwbmNONnplQUtMREJ2TXdYVzQ0QTFxb3gxV3lNSkI0UUdw?=
 =?utf-8?B?QzFHOUJhSDQ4dFlHODc0UEZwNVh2QjIyZHRxUnVackNXT01NNXpybjJWRFM4?=
 =?utf-8?B?anN5K2YrVXRYTnlTblpUeUdnV0ZXQkdmM1VXVVg5WC8rbkYrZWtoMXN5a3Ey?=
 =?utf-8?B?RllnQ0g5bmRtTllVRlZyT2xYOEYydWpaVExQcit2M0F3L05oZlBGckthVDFG?=
 =?utf-8?B?R0V4VnJwQWpoaHpyNm5OVUlpcU5pNTB5dEZtYVkxNnRyc2J6L25pTjdPb3lt?=
 =?utf-8?B?N2ZzQkFtL2o4VHRNR1FvcWJsS2xVWTQvY3RvdVBYZjVRZ0hSdU9La080a3Ir?=
 =?utf-8?B?NzEycDVDMnZtbjZXTEhiSUNkRm4yL3pWWk9kNHlUbnB5TTBPUVM3TmxhUVZs?=
 =?utf-8?B?d3pJcEFML0hDbEZNbUVOQ253NDFaSjVHM01LSG04OXFFNXUxZlRvRjZKSENC?=
 =?utf-8?B?c2dhZHZ4WW5EY1JFMU9DSTVHZ2FHTU9FQlhNOUI3ZUZGWGVVbGR5clhZYzUx?=
 =?utf-8?B?dnNPNDB2OWpEUS9SUUhpZmprbWNkSDVFRXNvcVdnNlBHWTJOUTBuTDhzWE1L?=
 =?utf-8?B?bWhyQkdYTGcxZ1F6c1BmQjRFS1Q1d3c3V0RsK1BGY2E0Y2tMZWRaaFdBZTJa?=
 =?utf-8?B?TTZYaERlUHBNODN2WEw0WVJiZVhYVUtQWmg4ZXRIbkxvL1hkMHVlTmFNWXg5?=
 =?utf-8?B?eWY1eVpwTE5XUnJ6MmJ4dlU5REVROHd6bXNqYUNDZGozYWdJWFl1Z3V6akJi?=
 =?utf-8?Q?LiRztLFajLDdGBxW9s5INs6E0imjYgBO4kV6+RZGAnbM=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-0555f.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 39f768d0-59f5-427d-3e2d-08dc54009740
X-MS-Exchange-CrossTenant-AuthSource: SE2P216MB1666.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 17:07:49.8912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB2137
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Reply-To: batripbcowrm@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8"></=
head>
<body>
<p></p>
<p></p>
<p><font size=3D"+0">Hello,thomas.kaltenbacher</font></p>
<p><font size=3D"+0">I hope this email finds you well.</font></p>
<p><font size=3D"+0">I am pleased to share our line of home sauna boxes wit=
h you. My=20
name is Iris, and I have over 5 years of experience in the field of home sa=
una=20
products. I can provide various types or customized versions of sauna boxes=
 to=20
enhance your store offerings.</font></p>
<p><font size=3D"+0">Here are my advantages:</font></p>
<p><font size=3D"+0">1.Minimum Order Quantity (MOQ): 1 unit<br>2.Customizab=
le sizes=20
and shapes<br>3.Fast delivery: approximately 3-5 days<br>4.Negotiable=20
pricing<br>5.Collaboration with multiple factories, ensuring alternatives a=
re=20
readily available if needed.<br>6.Order tracking for timely=20
deliveries<br>7.Customizable packaging options, offering more cost-effectiv=
e and=20
superior alternatives to factory-standard packaging<br>8.Production=20
scheduling<br>9.Quality inspection, including random checks to eliminate=20
defective products<br>10.Shipping arrangements<br>11.Post-sales=20
follow-up<br>12.Development of hot-selling products<br>If you would like to=
=20
learn more, please feel free to contact me anytime.</font></p>
<p><font size=3D"+0">Best regards,</font></p>
<p><font size=3D"+0">Iris</font></p>
<p><font size=3D"+0">WhatsApp=EF=BC=9A +86 147 1496 9186</font></p>
<p><img id=3D"img_insert_254231243182282853196416870033" src=3D"https://m.m=
edia-amazon.com/images/I/71L-JxqOfTL._AC_SL1500_.jpg"></p>
<p><font size=3D"+0"><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><br><p>&nbsp;</=
p><p>&nbsp;</p></font></p>
<p><font style=3D"BACKGROUND-COLOR: silver" color=3D"silver"><p>&quot;How a=
re you, Afy? I was going after you to Mrs. Latimer=E2=80=99s, not knowing b=
ut you had returned home. I saw you this morning at Miss Corny=E2=80=99s wi=
ndows.&quot;</p><p>&quot;Inside each of these Boards,&quot; explained the F=
airy, &quot;are accumulated the registers with the records of all women of =
the whole world; of those who have passed away, as well as of those who hav=
e not as yet come into it, and you, with your mortal eyes and human body, c=
ould not possibly be allowed to know anything in anticipation.&quot;</p><p>=
&quot;And so are you, old fellow,&quot; said the doctor, laughing.</p><p>&q=
uot;I don=E2=80=99t understand you.&quot;</p><p>&quot;Send her here when yo=
u have taken away those things.&quot;</p><p>Bethel quitted Mr. Carlyle with=
 the last word, and the latter gazed after him, revolving points in his bra=
in. The mention of Thorn=E2=80=99s name, the one spoken of by Richard Hare,=
 appeared to excite some feeling in Bethel=E2=80=99s mind, arousing it to i=
rritation. Mr. Carlyle remembered that it had done so previously and now it=
 had done so again, and yet Bethel was an easy-natured man in general, far =
better tempered than principled. That there was something hidden, some myst=
ery connected with the affair, Mr. Carlyle felt sure; but he could not atte=
mpt so much as a guess at what it might be. And this interview with Bethel =
brought him no nearer the point he wished to find out=E2=80=94whether this =
Thorn was the same man. In walking back to his office he met Mr. Tom Herber=
t.</p><p></p><p>&quot;When the perfume of flowers wafts (hsi jen) itself in=
to a man, he knows the day is warm.&quot;</p><p>&quot;I had just forgotten =
all about it,&quot; Tai-y=C3=BC rejoined, &quot;many thanks for your kind a=
ttention!</p><p>&quot;The red apricot tree is planted by the sun, and leans=
 against the clouds;&quot;</p><p>The faint echo of footsteps in the distanc=
e stole upon her ear, and Barbara drew a little back, and hid herself under=
 the shelter of the trees, not choosing to be seen by any stray passer-by. =
But, as they drew near, a sudden change came over her; her eyes lighted up,=
 her cheeks were dyed with crimson, and her veins tingled with excess of ra=
pture=E2=80=94for she knew those footsteps, and loved them, only too well.<=
/p><p>&quot;They don=E2=80=99t all speak like you, Garry,&quot; replied Sha=
ndon. &quot;They aren=E2=80=99t all in an obedient humour! Suppose they wer=
e to refuse to execute my orders?&quot;</p><p>&quot;How ever could she spar=
e the time to get as far as here?&quot; P=E2=80=99ing Erh smiled and replie=
d. &quot;But, she said, she hasn=E2=80=99t anything good to eat, so she bad=
e me, as she couldn=E2=80=99t possibly run over, come and find out whether =
there be any more crabs or not; (if there be), she enjoined me to ask for a=
 few to take to her to eat at home.&quot;</p><p>&quot;She has had one of th=
ose ridiculous dreams again,&quot; pursued Miss Carlyle, ignoring the prese=
nce of the governess and Lucy. &quot;I was sure of it by her very look when=
 I got in, shivering and shaking, and glancing fearfully around, as if she =
feared a dozen spectres were about to burst out of the walls. So I taxed he=
r with it, and she could make no denial. Richard is in some jeopardy, she p=
rotests, or will be. And there she is, shaking still, although I told her t=
hat people who put faith in dreams were only fit for a lunatic asylum.&quot=
;</p><p>Mr. Carlyle had never thought about the name. But he replied, prett=
y promptly.</p><p></p><p>&quot;Indeed!&quot; said Endymion; &quot;papa is v=
ery much in favour of the Church, and, I know, is writing something about i=
t.&quot;</p><p>&quot;Oh, I wish you would,&quot; was Barbara=E2=80=99s deli=
ghted response. &quot;Do bring it here and join it now. Shall I bribe you?&=
quot; she added, laughing. &quot;You make this all right, and then you shal=
l bear back grace to Lucy=E2=80=94for I perceive that is what your heart is=
 set upon.&quot;</p><p>&quot;Do you hope it, papa?&quot;</p><p>Seating hims=
elf upstairs next to old lady Chia, he called to a servant-girl to fetch th=
e tray of presents given to him a short while back, and putting on his own =
trinket of jade, he fumbled about with the things for a bit, and picking up=
 one by one, he handed them to his grandmother to admire. But old lady Chia=
 espied among them a unicorn, made of purplish gold, with kingfisher feathe=
rs inserted, and eagerly extending her arm, she took it up. &quot;This obje=
ct,&quot; she smiled, &quot;seems to me to resemble very much one I=E2=80=
=99ve seen worn also by the young lady of some household or other of ours.&=
quot;</p><p>Time=E2=80=99s march moves slowly, where weary lives languish i=
n dull places.</p><p>&quot;Yea,&quot; said he, &quot;many a time.&quot;</p>=
<p>The two young men, and Fragoso and Joam Garral, thinking no more of dang=
er, rushed out of the house, guns in hand.</p><p>Lady Feng issued prompt di=
rections to Ts=E2=80=99ai Ming to prepare a register; and sending, there an=
d then, for Lai Sheng=E2=80=99s wife, she asked her to submit, for her peru=
sal, the roll with the servants=E2=80=99 names. She furthermore fixed upon =
an early hour of the following day to convene the domestics and their wives=
 in the mansion, in order that they should receive their orders; but, after=
 cursorily glancing over the number of entries in the list, and making a fe=
w inquiries of Lai Sheng=E2=80=99s wife, she soon got into her curricle, an=
d went home.</p><p>The question had to be decided before nightfall, and the=
 sooner it was settled the better.</p><p>&quot;I saw him just now,&quot; Pa=
o-ch=E2=80=99ai replied, &quot;go out, dressed up in his fineries. But wher=
e he is gone to, I don=E2=80=99t know.&quot;</p><p>&quot;Confound the guari=
ba!&quot; he shouted at length. &quot;There will be no end to this, and he =
will lead me back to the Brazilian frontier. If only he would let go of my =
case! But no! The jingling of the money amuses him. Oh, you thief! If I cou=
ld only get hold of you!&quot;</p><p>&quot;Her ladyship. She looks just as =
if she=E2=80=99d never get over it.&quot;</p><p>One other thing may be told=
 of her. She had given her heart, for good and all, as she owned to herself=
, to Frank Greystock. She had owned to herself that it was so, and had owne=
d to herself that nothing could come of it. Frank was becoming a man of mar=
k, but was becoming a man of mark without much money. Of all men he was the=
 last who could afford to marry a governess. And then, moreover, he had nev=
er said a word to make her think that he loved her. He had called on her on=
ce or twice at Fawn Court, as why should he not? Seeing that there had been=
 friendship between the families for so many years, who could complain of t=
hat? Lady Fawn, however, had not complained; but just said a word. A word i=
n season, how good is it? Lucy did not much regard the word spoken to herse=
lf; but when she reflected that a word must also have been spoken to Mr. Gr=
eystock =E2=80=94 otherwise how should it have been that he never came agai=
n =E2=80=94 that she did not like.</p><p>&quot;=E2=80=98You acted for the b=
est, my man. Now search the place carefully, while I stand here. I am on my=
 parole, I shall not run away. Jacob, go down and help them.=E2=80=99</p><p=
>Having instructed Malcolm to take the letter to the lawyer=E2=80=99s house=
, and, if he was not at home, to inquire where he might be found, Randal ad=
opted the readiest means of composing himself, in the servant=E2=80=99s abs=
ence, by lighting his pipe.</p><p>T=E2=80=99an Ch=E2=80=99un said:</p><p></=
p><p>Pao-y=C3=BC withdrew out of the room, and came by the back to the uppe=
r apartment; and as soon as madame Hsing caught sight of him, she, before e=
verything else, rose to her feet and asked after old lady Chia=E2=80=99s he=
alth; after which, Pao-y=C3=BC made his own salutation, and madame Hsing dr=
ew him on to the stove-couch, where she induced him to take a seat, and eve=
ntually inquired after the other inmates, and also gave orders to serve the=
 tea. But scarcely had they had tea, before they perceived Chia Tsung come =
in to pay his respects to Pao-y=C3=BC.</p><p>&quot;Which meant, not until t=
he next time. Of all capricious, vain, exacting women, Emma Vane was the wo=
rst; and Emma Mount Severn is no improvement upon it; she=E2=80=99s a syste=
matic flirt, and nothing better. I drove recklessly on purpose to put her i=
n a fright, and pay her off.&quot;</p><p>&quot;So I had,&quot; replied the =
fast nobleman addressed, the son of a marquis. &quot;But I am on the lookou=
t, so am forced into them again. I think a ball-room the greatest bore in l=
ife.&quot;</p><p>&quot;Lean on me, mamma. When you reach those benches, you=
 can take a good rest before proceeding to the house. It is very warm, and =
that may have fatigued you.&quot;</p><p>&quot;The gentleman came here befor=
e. Couldn=E2=80=99t he come here again?&quot; Then he explained to her the =
difference of her present position, and in doing so he did say something of=
 her iniquity. He made her understand that the magistrate had gone out of h=
is way at the last inquiry, believing her to be a lady who had been grievou=
sly wronged, and one, therefore, to whom much consideration was due. &quot;=
And I have been grievously wronged,&quot; said Lizzie. But now she would be=
 required to tell the truth in opposition to the false evidence which she h=
ad formerly given; and she would herself be exempted from prosecution for p=
erjury only on the ground that she would be called on to criminate herself =
in giving evidence against criminals whose crimes had been deeper than her =
own. &quot;I suppose they can=E2=80=99t quite eat me,&quot; she said, smili=
ng through her tears.</p><p>&quot;We shall have some trouble with France,&q=
uot; said the ambassador, &quot;unless there is a change here.&quot;</p><p>=
While she spoke, orders were given to remove the remnants of the banquet, a=
nd inside as well as outside; were served every kind of recherch=C3=A9 smal=
l dishes. One and all then partook of some of these refreshments, at their =
pleasure, and rinsing their mouths with tea, they afterwards parted.</p><p>=
The pale globe of the sun hung trembling in the haze himself had made. My f=
ather rose to see the last, and reared his tall form upright against the de=
epening background. He gazed as if the course of life lay vanishing below h=
im, while level land and waters drew the breadth of shadow over them. Then =
the last gleam flowed and fled upon the face of ocean, and my father put hi=
s dry lips to my forehead, saying nothing.</p><p>&quot;We must drift,&quot;=
 answered Hatteras; &quot;we can=E2=80=99t help ourselves.&quot;</p><p>The =
effect of this note was to drive Lizzie back upon the Fawn interest. She wa=
s frightened about the diamonds, and was, nevertheless, almost determined n=
ot to surrender them. At any rate, in such a strait she would want assistan=
ce, either in keeping them or in giving them up. The lawyer=E2=80=99s lette=
r afflicted her with a sense of weakness, and there was strength in the Faw=
n connection. As Lord Fawn was so poor, perhaps he would adhere to the jewe=
ls. She knew that she could not fight Mr. Camperdown with no other assistan=
ce than what Messrs. Mowbray &amp; Mopus might give her, and therefore her =
heart softened toward her betrothed. &quot;I suppose Frederic will be here =
today,&quot; she said to Miss Macnulty, as they sat at breakfast together a=
bout noon. Miss Macnulty nodded. &quot;You can have a cab, you know, if you=
 like to go anywhere.&quot; Miss Macnulty said she thought she would go to =
the National Gallery. &quot;And you can walk back, you know,&quot; said Liz=
zie.</p><p>&quot;It=E2=80=99s nice in here, it=E2=80=99s nice in here,&quot=
; exclaimed Pao-y=C3=BC with a chuckle.</p><p>&quot;My dear younger brother=
,&quot; Hs=C3=BCeh P=E2=80=99an pleaded, with a groan.</p><p>&quot;Your ref=
erence to pictures,&quot; added Hs=C3=BCeh P=E2=80=99an smiling, &quot;remi=
nds me of a book I saw yesterday, containing immodest drawings; they were, =
truly, beautifully done. On the front page there figured also a whole lot o=
f characters. But I didn=E2=80=99t carefully look at them; I simply noticed=
 the name of the person, who had executed them. It was, in fact, something =
or other like Keng Huang. The pictures were, actually, exceedingly good!&qu=
ot;</p><p>While they indulged in chatting and laughing, the plays they had =
chosen were all finished; whereupon the tables were cleared of the wines, a=
nd the repast was served. The meal over, the whole company adjourned into t=
he garden, and came and sat in the drawing-room. After tea, they at length =
gave orders to get ready the carriages, and they took their leave of Mrs. Y=
u=E2=80=99s mother. Mrs. Yu, attended by all the secondary wives, servants,=
 and married women, escorted them out, while Chia Chen, along with the whol=
e bevy of young men, stood by the vehicles, waiting in a group for their ar=
rival.</p><p>&quot;I dare say most young men are excellent when you come to=
 know them. What does Lord George say?&quot;</p><p>Upon this, the Sawyer be=
ing tickled, as men very often are in sad moments, took the doctor by the h=
and, and gave him the bullet heartily. And the medical man had a loop made =
to it, and wore it upon his watch chain. And he told the story so often (sa=
ying that another man perhaps might have got it out, but no other man could=
 have kept it), that among a great race who judge by facts it doubled his p=
ractice immediately.</p><p>&quot;I am waited for, to keep an important enga=
gement,&quot; he answered. &quot;And were my time at liberty, I should decl=
ine to tell them to you, on my own account, as well as on yours. Lay not di=
scourtesy to my charge, Lady Levison. Were I to speak of the man, even to y=
ou, his name would blister my lips.&quot;</p><p>&quot;It=E2=80=99s=E2=80=94=
it=E2=80=99s=E2=80=94never his own father that he accuses? Justice Hare?&qu=
ot;</p><p>Mr. Otway Bethel, conscious, probably, that nobody would offer ba=
il for him, not even the colonel, did not ask the bench to take it. So the =
two were fully committed to take their trial for the &quot;Wilful murder, o=
therwise the killing and slaying of George Hallijohn;&quot; and before nigh=
t would be on their road to the county prison at Lynneborough.</p><p>Little=
 notion had she of the broad gauge those questions would run upon. And she =
was sworn accordingly. Very unwillingly yet; for Afy, who would have told l=
ies by the bushel unsworn, did look upon an oath as a serious matter, and f=
elt herself compelled to speak the truth when examined under it.</p><p>&quo=
t;For if I should be seen and recognized, it might come to hanging, you kno=
w, sir. You are expecting that cursed Thorn here, Barbara told me.&quot;</p=
><p>&quot;Is it the child? You don=E2=80=99t mean to tell me that Herbert h=
as taken Kitty away from her mother!&quot;</p><p>An uncommon good hand at a=
n impromptu tale was Afy. And Mrs. Latimer consented to her demand. Afy fle=
w upstairs, attired herself once more, put one or two things in a small lea=
ther bag, placed some money in her purse, and left the house.</p><p>This I =
did not know at present, not having been there long enough; neither had I a=
ny terror of that sort, not being quite such a coward, I should hope. But s=
till, as the mantles of the cold trees darkened, and the stony remembrance =
of the dead grew pale, and of the living there was not even the whistle of =
a grave-digger =E2=80=94 my heart got the better of my mind for a moment, a=
nd made me long to be across that stile again. Because (as I said to myself=
) if there had been a hill to go up, that would be so different and so easy=
; but going down into a place like this, whence the only escape must be by =
steps, and where any flight must be along channels that run in and out of g=
raves and tombstones, I tried not to be afraid, yet could not altogether he=
lp it.</p><p>&quot;What should you have done?&quot; he smiled.</p><p>&quot;=
At any rate, his ill doings or well doings cannot affect us for the short p=
eriod he is likely to remain. You have taken a prejudice against him also, =
I suppose, Isabel.&quot;</p><p>&quot;There was more said. Mr. Levison, in a=
 shameful sort of manner, asked his uncle, would he let him have five or te=
n pounds? Sir Peter seemed angry, and asked, what had he done with the fift=
y-pound note he had made him a present of only the previous morning? Mr. Le=
vison replied that he had sent that away to a brother officer, to whom he w=
as in debt. Sir Peter refused to believe it, and said he had more likely sq=
uandered it upon some disgraceful folly. Mr. Levison denied that he had; bu=
t he looked confused, indeed, his matter altogether was confused that morni=
ng.&quot;</p><p>&quot;My dear,&quot; she began, &quot;we all want you to do=
 us a particular favour.&quot; As she said this, she held Lucy by the hand,=
 and no one looking at them would have thought that Lucy was a governess an=
d that Lady Fawn was her employer.</p><p>&quot;Nothing does have charms for=
 her that ought to have,&quot; growled Justice Hare. &quot;She=E2=80=99s on=
e of the contrary ones. By the way, though,&quot; hastily resumed the justi=
ce, leaving the objectionable subject, as another flashed across his memory=
, &quot;they were coupling your name and matrimony together, Carlyle, last =
night, at the Buck=E2=80=99s Head.&quot;</p><p>Bones, white and bleached, i=
n nameless hill-like mounds are flung,</p><p>&quot;Who?&quot; asked Joyce.<=
/p><p>&quot;Well, since that be the case,&quot; added old lady Chia, &quot;=
why do you, at your age, try your strength by running about the whole day l=
ong? Take him at once along and let them see it! But were you to have calle=
d him in there, wouldn=E2=80=99t it have saved a lot of trouble?&quot;</p><=
p>As the days passed on, Lady Isabel improved wonderfully. She was soon abl=
e to go to the sands in the morning and sit there to enjoy the sea air, wat=
ching the waves come up to recede with the tide. She made no acquaintance w=
hatever in the place, and when she had a companion it was Captain Levison. =
He would frequently join her there, sometimes take her, almost always give =
her his arm home. Of all things, she disliked the having to take his arm, w=
ould a thousand times over rather have taken good old Peter=E2=80=99s. A se=
cret prick of the conscience whispered it might be better if she did not. O=
ne day she said, in a joking sort of manner=E2=80=94she would not say it in=
 any other=E2=80=94that now she was strong, she had no need of his arm and =
his escort. He demanded, in evident astonishment, what had arisen that he m=
ight not still afford it, seeing her husband was not with her to give her h=
is. She had no answer in reply to this, no excuse to urge, and, in default =
of one, took his arm, as usual. In the evening he would be ready to take he=
r to the pier, but they sat apart, mixing not with the bustling crowd=E2=80=
=94he lending to his manner, as he conversed with her, all that he would ca=
ll up of fascination=E2=80=94and fascination, such as Francis Levison=E2=80=
=99s, might be dangerous to any ear, in the sweet evening twilight. The wal=
k over, he left her at her own door; she never asked him in in the evening,=
 and he did not intrude without, as he sometimes would of a morning.</p><p>=
&quot;Thank you. I will sit outside.&quot;</p><p>&quot;I am quite sure I ne=
ver thought that!&quot;</p><p>For the first time since the beginning of the=
 interview, she allowed the impulse of the moment to lead her astray. In he=
r eagerness to complete the act of atonement, she failed to appreciate the =
severity of the struggle that was passing in Catherine=E2=80=99s mind. She =
alluded again to Herbert Linley, and she spoke too soon.</p><p>&quot;Hopele=
ss. Quite hopeless, Mrs. Linley.&quot;</p><p>&quot;Uncle Jui,&quot; he hear=
d some one on the couch explain, laughing, &quot;was trying to take liberti=
es with me!&quot;</p><p>Lucy had a few books of her own, and she determined=
 to ask Frank to send her some. Books are cheap things, and she would not m=
ind asking him for magazines, and numbers, and perhaps for the loan of a fe=
w volumes. In the mean time she did read Tupper=E2=80=99s poem, and &quot;P=
ride and Prejudice,&quot; and one of Miss Edgeworth=E2=80=99s novels =E2=80=
=94 probably for the third time. During the first week in Bruton Street she=
 would have been comfortable enough, only that she had not received a line =
from Frank. That Frank was not specially good at writing letters, she had a=
lready taught herself to understand. She was inclined to believe that but f=
ew men of business do write letters willingly, but that, of all men, lawyer=
s are the least willing to do so. How reasonable it was that a man who had =
to perform a great part of his daily work with a pen in his hand should loa=
the a pen when not at work. To her the writing of letters was perhaps the m=
ost delightful occupation of her life, and the writing of letters to her lo=
ver was a foretaste of heaven; but then men, as she knew, are very differen=
t from women. And she knew this also, that, of all her immediate duties, no=
 duty could be clearer than that of abstaining from all jealousy, petulance=
, and impatient expectation of little attentions. He loved her, and had tol=
d her so, and had promised her that she should be his wife, and that ought =
to be enough for her. She was longing for a letter, because she was very an=
xious to know whether she might mention his name to Lady Linlithgow; but sh=
e would abstain from any idea of blaming him because the letter did not com=
e.</p></font></p><font style=3D"BACKGROUND-COLOR: silver" color=3D"silver">
<p><br>&nbsp;&nbsp;&nbsp; =E6=A1=90=E6=9E=97=E6=A1=A5=E5=8F=A3=EF=BC=8C=E5=
=B4=94=E6=96=8C=E5=B8=A6=E7=9D=80=E6=95=B4=E6=95=B4=E4=BA=94=E5=8D=81=E5=90=
=8D=EF=BC=8C=E4=BB=8E=E5=8D=8E=E9=83=BD=E8=B5=B6=E6=9D=A5=E7=9A=84=E5=8C=97=
=E5=A0=82=E5=8F=A3=E5=85=84=E5=BC=9F=EF=BC=8C=E5=B0=86=E8=B7=AF=E9=9D=A2=E5=
=B0=81=E6=AD=BB=E3=80=82</p>
<p>&nbsp;&nbsp;&nbsp; =E6=9D=9C=E8=83=9C=E6=98=8E=E7=9A=84=E8=BD=A6=E9=98=
=9F=E8=BF=87=E4=B8=8D=E5=8E=BB=EF=BC=8C=E5=8F=AA=E8=83=BD=E5=81=9C=E5=9C=A8=
=E4=B8=80=E7=99=BE=E7=B1=B3=E5=BC=80=E5=A4=96=E7=9A=84=E4=BD=8D=E7=BD=AE=E3=
=80=82</p>
<p>&nbsp;&nbsp;&nbsp; =E8=BD=A6=E5=86=85=EF=BC=8C=E6=9D=9C=E8=83=9C=E6=98=
=8E=E7=9C=AF=E7=9C=BC=E7=9C=8B=E4=BA=86=E4=B8=80=E7=9C=BC=E6=A1=A5=E5=8F=A3=
=E7=9A=84=E4=BA=BA=EF=BC=9A=E2=80=9C=E8=BF=99=E4=BB=96=E5=A6=88=E5=93=AA=E5=
=A4=B4=E7=9A=84=EF=BC=9F=EF=BC=81=E2=80=9D</p>
<p>&nbsp;&nbsp;&nbsp; =E6=A1=A5=E5=8F=A3=E5=A4=84=EF=BC=8C=E5=91=A8=E5=AE=
=B6=E7=9A=84=E4=BA=BA=E7=BB=9F=E4=B8=80=E7=9D=80=E8=A3=85=EF=BC=8C=E9=83=BD=
=E7=A9=BF=E7=9D=80=E9=BB=91=E8=89=B2T=E6=81=A4=EF=BC=8C=E6=85=A2=E6=85=A2=
=E5=90=91=E9=81=93=E8=B7=AF=E4=B8=AD=E5=A4=AE=E8=81=9A=E9=9B=86=E3=80=82</p=
>
<p>&nbsp;&nbsp;&nbsp; =E2=80=9C=E4=B8=8D=E5=83=8F=E6=98=AF=E6=9C=AC=E5=9C=
=B0=E7=9A=84=EF=BC=8C=E2=80=9D=E5=A4=A7=E5=9E=8B=E8=B6=8A=E9=87=8E=E8=BD=A6=
=E5=86=85=EF=BC=8C=E4=B8=80=E5=90=8D=E9=9D=92=E5=B9=B4=E7=8E=87=E5=85=88=E5=
=BC=80=E5=8F=A3=E8=AF=B4=E9=81=93=EF=BC=9A=E2=80=9C=E5=A5=BD=E5=83=8F=E6=98=
=AF=E5=A4=96=E5=9C=B0=E7=9A=84=EF=BC=8C=E4=BD=A0=E7=9C=8B=E4=BB=96=E4=BB=AC=
=E7=9A=84=E8=A1=A3=E6=9C=8D=E2=80=A6=E2=80=A6=E3=80=82=E2=80=9D</p>
<p>&nbsp;&nbsp;&nbsp; =E2=80=9C=E6=98=AF=E5=A4=96=E5=9C=B0=E7=9A=84=EF=BC=
=8C=E5=B0=B1=E4=B8=8D=E6=98=AF=E6=88=91=E4=BB=AC=E7=9A=84=E4=BA=BA=E3=80=82=
=E2=80=9D=E6=9D=9C=E8=83=9C=E6=98=8E=E9=99=8D=E4=B8=8B=E8=BD=A6=E7=AA=97=EF=
=BC=8C=E6=8A=AC=E5=A4=B4=E5=96=8A=E4=BA=86=E4=B8=80=E5=8F=A5=EF=BC=9A=E2=80=
=9C=E5=95=A5=E6=84=8F=E6=80=9D=E5=95=8A=EF=BC=8C=E8=A6=81=E8=B8=8F=E9=A9=AC=
=E6=94=B6=E5=85=BB=E8=B7=AF=E8=B4=B9=E5=95=8A=EF=BC=9F=E2=80=9D</p>
<p>&nbsp;&nbsp;&nbsp; =E5=B4=94=E6=96=8C=E7=AB=99=E5=9C=A8=E4=BA=BA=E7=BE=
=A4=E5=89=8D=E4=BE=A7=EF=BC=8C=E9=9D=A2=E6=97=A0=E8=A1=A8=E6=83=85=E5=9C=B0=
=E5=96=8A=E9=81=93=EF=BC=9A=E2=80=9C=E5=85=A5=E8=82=A1=E4=BD=99=E5=AE=B6=E4=
=BA=86=EF=BC=8C=E4=BB=96=E4=BB=AC=E7=9A=84=E4=BA=8B=E5=84=BF=EF=BC=8C=E5=B0=
=B1=E6=98=AF=E5=92=B1=E8=87=AA=E5=B7=B1=E7=9A=84=E4=BA=8B=E3=80=82=E6=9D=A5=
=EF=BC=8C=E5=8C=97=E5=A0=82=E7=9A=84=E5=85=84=E5=BC=9F=EF=BC=8C=E7=BB=99=E6=
=88=91=E5=89=81=EF=BC=81=E2=80=9D</p>
<p>&nbsp;&nbsp;&nbsp; =E2=80=9C=E5=91=BC=E5=95=A6=E5=95=A6=EF=BC=81=E2=80=
=9D</p>
<p>&nbsp;&nbsp;&nbsp; =E4=BA=94=E5=8D=81=E5=8F=B7=E4=BA=BA=E5=90=AC=E5=88=
=B0=E5=B4=94=E6=96=8C=E7=9A=84=E5=96=8A=E5=A3=B0=EF=BC=8C=E6=B2=A1=E6=9C=89=
=E4=B8=80=E4=BA=BA=E7=8A=B9=E8=B1=AB=EF=BC=8C=E6=8B=8E=E7=9D=80=E5=87=B6=E5=
=99=A8=E5=B0=B1=E5=86=B2=E5=90=91=E4=BA=86=E8=BD=A6=E9=98=9F=E3=80=82</p>
<p>&nbsp;&nbsp;&nbsp; =E6=9D=9C=E8=83=9C=E6=98=8E=E5=9D=90=E5=9C=A8=E8=BD=
=A6=E5=86=85=EF=BC=8C=E8=A7=81=E5=AF=B9=E6=96=B9=E4=BA=BA=E5=B9=B6=E4=B8=8D=
=E5=A4=9A=EF=BC=8C=E7=AB=8B=E5=8D=B3=E6=8A=AC=E5=A4=B4=E5=86=B2=E7=9D=80=E5=
=8F=B8=E6=9C=BA=E5=96=8A=E9=81=93=EF=BC=9A=E2=80=9C=E5=BE=80=E5=90=8E=E9=80=
=80=E9=80=80=EF=BC=8C=E5=85=B6=E4=BB=96=E5=85=84=E5=BC=9F=E4=B8=8B=E8=BD=A6=
=EF=BC=8C=E7=BB=99=E6=88=91=E5=86=B2=E6=95=A3=E4=BB=96=E4=BB=AC=E3=80=82=E2=
=80=9D</p>
<p>&nbsp;&nbsp;&nbsp;=20
=E8=AF=9D=E9=9F=B3=E8=90=BD=EF=BC=8C=E5=A4=A7=E5=9E=8B=E8=B6=8A=E9=87=8E=E8=
=BD=A6=E5=90=8E=E9=80=80=EF=BC=8C=E5=90=8E=E9=9D=A2=E5=8D=A1=E8=BD=A6=E5=92=
=8C=E5=85=B6=E4=BB=96=E8=BD=A6=E8=BE=86=E9=A1=B6=E4=BA=86=E4=B8=8A=E5=8E=BB=
=EF=BC=8C=E5=8D=81=E5=87=A0=E5=90=8D=E5=B8=A6=E9=98=9F=E7=9A=84=E9=9D=92=E5=
=B9=B4=EF=BC=8C=E5=8F=B3=E6=89=8B=E4=B8=8A=E6=88=B4=E7=9D=80=E6=89=8B=E5=A5=
=97=EF=BC=8C=E4=B8=8B=E8=BD=A6=E5=90=8E=E5=96=8A=E9=81=93=EF=BC=9A=E2=80=9C=
=E9=83=BD=E8=B8=8F=E9=A9=AC=E4=B8=8B=E8=BD=A6=EF=BC=8C=E5=86=B2=E6=95=A3=E4=
=BB=96=E4=BB=AC=EF=BC=81=E2=80=9D</p>
<p>&nbsp;&nbsp;&nbsp; =E9=95=BF=E6=B8=85=E7=9A=84=E4=BA=BA=E5=99=BC=E9=87=
=8C=E5=95=AA=E5=95=A6=E5=9C=B0=E4=BB=8E=E5=8D=A1=E8=BD=A6=E4=B8=8A=E8=B7=B3=
=E4=BA=86=E4=B8=8B=E6=9D=A5=EF=BC=8C=E8=BF=88=E6=AD=A5=E4=B9=9F=E5=BE=80=E5=
=89=8D=E5=86=B2=E5=8E=BB=E3=80=82</p>
<p>&nbsp;&nbsp;&nbsp;=20
=E4=BA=94=E5=85=AD=E7=A7=92=E5=90=8E=EF=BC=8C=E5=8F=8C=E6=96=B9=E5=89=8D=E6=
=8E=92=E4=BA=BA=E9=A9=AC=E7=A2=B0=E9=9D=A2=EF=BC=8C=E7=9E=AC=E9=97=B4=E6=B7=
=B7=E6=88=98=E5=9C=A8=E4=BA=86=E4=B8=80=E5=9D=97=E3=80=82=E5=B4=94=E6=96=8C=
=E5=8F=B3=E6=89=8B=E6=8B=8E=E7=9D=80=E5=BE=88=E7=9F=AD=E5=B0=8F=E7=9A=84=E5=
=B0=BC=E6=B3=8A=E5=B0=94=E7=A0=8D=E5=88=80=EF=BC=8C=E5=B7=A6=E6=89=8B=E6=94=
=A5=E7=9D=80=E4=B8=80=E6=8A=8A=E5=AF=92=E5=85=89=E5=9B=9B=E5=B0=84=E7=9A=84=
=E5=86=9B=E5=88=BA=EF=BC=8C=E8=A7=81=E4=BA=BA=E7=BE=A4=E5=86=B2=E6=9D=A5=E5=
=90=8E=EF=BC=8C=E4=BE=A7=E8=BA=AB=E9=97=AA=E8=BA=B2=EF=BC=8C=E5=8F=B3=E6=89=
=8B=E7=9B=B4=E6=8E=A5=E5=90=91=E4=B8=8A=E4=B8=80=E6=8C=91=E3=80=82</p>
<p>&nbsp;&nbsp;&nbsp; =E2=80=9C=E5=BD=93=E5=95=B7=EF=BC=81=E2=80=9D</p>
<p>&nbsp;&nbsp;&nbsp; =E4=B8=80=E6=8A=8A=E9=93=81=E6=A3=8D=E8=A2=AB=E6=9E=
=B6=E5=BC=80=EF=BC=8C=E5=B4=94=E6=96=8C=E5=B7=A6=E6=89=8B=E6=94=A5=E7=9D=80=
=E5=B0=8F=E5=86=9B=E5=88=BA=EF=BC=8C=E5=90=91=E5=B7=A6=E6=8B=89=E4=BA=86=E4=
=B8=80=E4=B8=8B=E8=BA=AB=E4=BD=8D=EF=BC=8C=E4=B8=80=E5=88=80=E5=B0=B1=E6=8D=
=85=E8=BF=9B=E4=BA=86=E5=AF=B9=E6=96=B9=E7=9A=84=E8=82=8B=E9=AA=A8=E3=80=82=
</p>
<p>&nbsp;&nbsp;&nbsp; =E2=80=9C=E5=99=97=E5=97=A4=EF=BC=81=E2=80=9D</p>
<p>&nbsp;&nbsp;&nbsp; =E5=AF=B9=E6=96=B9=E6=B1=89=E5=AD=90=E9=B2=9C=E8=A1=
=80=E6=A8=AA=E6=B5=81=EF=BC=8C=E5=B4=94=E6=96=8C=E5=B7=A6=E6=89=8B=E6=8B=94=
=E5=88=80=EF=BC=8C=E5=8F=B3=E8=87=82=E6=8A=AC=E8=B5=B7=EF=BC=8C=E5=AF=B9=E7=
=9D=80=E5=AF=B9=E6=96=B9=E7=9A=84=E8=84=91=E8=A2=8B=EF=BC=8C=E5=92=A3=E5=92=
=A3=E5=B0=B1=E6=98=AF=E4=B8=A4=E5=88=80=E3=80=82</p>
<p>&nbsp;&nbsp;&nbsp; =E2=80=9C=E5=97=A1=EF=BC=81=E2=80=9D</p>
<p>&nbsp;&nbsp;&nbsp; =E5=8F=8C=E6=96=B9=E6=B7=B7=E6=88=98=E5=9C=A8=E4=BA=
=86=E4=B8=80=E5=9D=97=EF=BC=8C=E4=B8=80=E5=8F=B0=E8=B6=8A=E9=87=8E=E8=BD=A6=
=E4=BB=8E=E8=83=A1=E5=90=8C=E5=86=85=E5=86=B2=E4=BA=86=E5=87=BA=E6=9D=A5=EF=
=BC=8C=E7=9B=B4=E5=A5=94=E9=95=BF=E6=B8=85=E4=BA=BA=E7=BE=A4=E7=9A=84=E4=B8=
=AD=E5=A4=AE=E6=92=9E=E5=8E=BB=E3=80=82</p>
<p>&nbsp;&nbsp;&nbsp; =E5=AF=B9=E6=96=B9=E8=A7=81=E8=BD=A6=E8=BE=86=E4=B8=
=8D=E5=87=8F=E9=80=9F=E5=9C=B0=E6=92=9E=E8=BF=87=E6=9D=A5=EF=BC=8C=E7=AB=8B=
=E5=8D=B3=E7=BA=B7=E7=BA=B7=E4=BE=A7=E8=BA=AB=E9=97=AA=E8=BA=B2=E3=80=82=E4=
=B8=80=E6=9D=A1=E9=81=93=E8=B7=AF=E8=A2=AB=E5=86=B2=E5=BC=80=EF=BC=8C=E8=BD=
=A6=E8=BE=86=E5=AE=9B=E8=8B=A5=E5=BF=AB=E9=A9=AC=EF=BC=8C=E7=9B=B4=E6=8E=A5=
=E5=86=B2=E5=90=91=E4=BA=86=E6=9D=9C=E8=83=9C=E6=98=8E=E7=9A=84=E9=82=A3=E4=
=B8=80=E4=BE=A7=E3=80=82</p>
<p>&nbsp;&nbsp;&nbsp; =E2=80=9C=E4=BB=96=E5=A6=88=E4=BA=86=E4=B8=AAB=E7=9A=
=84=EF=BC=8C=E8=BF=98=E5=A5=94=E6=88=91=E6=9D=A5=E4=BA=86=E3=80=82=E2=80=9D=
=E6=9D=9C=E8=83=9C=E6=98=8E=E5=9D=90=E5=9C=A8=E8=BD=A6=E5=86=85=E9=AA=82=E4=
=BA=86=E4=B8=80=E5=8F=A5=EF=BC=8C=E6=8C=91=E7=9D=80=E7=9C=89=E6=AF=9B=EF=BC=
=8C=E4=BC=B8=E6=89=8B=E4=B9=9F=E4=BB=8E=E5=B8=86=E5=B8=83=E8=A2=8B=E5=AD=90=
=E9=87=8C=E6=8B=BD=E5=87=BA=E4=BA=86=E5=88=80=E3=80=82</p>
<p>&nbsp;&nbsp;&nbsp; =E2=80=9C=E5=98=AD=EF=BC=81=E2=80=9D</p>
<p>&nbsp;&nbsp;&nbsp; =E4=B8=80=E5=A3=B0=E9=97=B7=E5=93=8D=EF=BC=8C=E8=B6=
=8A=E9=87=8E=E8=BD=A6=E5=A4=B4=E6=92=9E=E5=9C=A8=E4=BA=86=E5=A4=A7=E5=9E=8B=
SUV=E4=BE=A7=E9=9D=A2=EF=BC=8C=E4=B8=A4=E8=BD=A6=E5=89=A7=E7=83=88=E6=91=87=
=E6=99=83=EF=BC=8C=E8=BD=A6=E8=BA=AB=E7=A2=8E=E5=B1=91=E6=A8=AA=E9=A3=9E=EF=
=BC=8C=E9=93=81=E6=9D=BF=E5=87=B9=E9=99=B7=E3=80=82</p>
<p>&nbsp;&nbsp;&nbsp; =E2=80=9C=E5=92=A3=E5=BD=93=EF=BC=81=E2=80=9D</p>
<p>&nbsp;&nbsp;&nbsp; =E8=B6=8A=E9=87=8E=E8=BD=A6=E9=97=A8=E7=8E=87=E5=85=
=88=E5=BC=B9=E5=BC=80=EF=BC=8C=E5=9C=A8=E9=BE=99=E5=9F=8E=E6=B6=88=E5=A4=B1=
=E4=BA=86=E4=B8=80=E4=B8=AA=E5=A4=9A=E6=9C=88=E7=9A=84=E5=A4=A7=E7=86=8A=EF=
=BC=8C=E7=8E=87=E5=85=88=E5=86=B2=E4=B8=8B=E4=BA=86=E6=B1=BD=E8=BD=A6=EF=BC=
=8C=E4=BB=8E=E5=90=8E=E5=BA=A7=E5=86=85=E6=96=9C=E7=9D=80=E6=8B=BD=E5=87=BA=
=E4=BA=86=E4=B8=80=E6=8A=8A=E4=B8=80=E7=B1=B3=E5=8D=8A=E9=95=BF=E7=9A=84=E5=
=A4=A7=E7=A0=8D=E5=88=80=E3=80=82</p>
<p>&nbsp;&nbsp;&nbsp; =E8=BF=99=E6=8A=8A=E5=88=80=E5=BE=88=E9=95=BF=EF=BC=
=8C=E5=88=80=E6=9F=84=E6=98=AF=E4=B8=A4=E6=89=8B=E5=90=88=E6=8F=A1=E7=9A=84=
=E9=82=A3=E7=A7=8D=EF=BC=8C=E7=9C=8B=E7=9D=80=E8=B4=BC=E5=83=8F=E6=94=B9=E8=
=89=AF=E7=89=88=E7=9A=84=E5=8F=A4=E4=BB=A3=E6=88=9A=E5=AE=B6=E5=88=80=E3=80=
=82</p>
<p>&nbsp;&nbsp;&nbsp;=20
=E6=AD=A3=E5=B8=B8=E4=BA=BA=E6=8B=BF=E8=BF=99=E6=A0=B7=E7=9A=84=E5=88=80=E5=
=B9=B2=E6=9E=B6=E7=BB=9D=E5=AF=B9=E6=98=AF=E5=82=BB=E5=AD=90=EF=BC=8C=E5=9B=
=A0=E4=B8=BA=E5=AE=83=E5=A4=AA=E9=95=BF=E4=BA=86=EF=BC=8C=E8=80=8C=E8=A1=97=
=E5=A4=B4=E7=81=AB=E6=8B=BC=E5=8F=88=E4=B8=8D=E6=98=AF=E6=8B=8D=E6=AD=A6=E4=
=BE=A0=E7=89=87=E5=AD=90=EF=BC=8C=E5=8F=8C=E6=96=B9=E8=B4=B4=E8=BA=AB=E5=B9=
=B2=E8=B5=B7=E6=9D=A5=EF=BC=8C=E5=BE=88=E5=A4=9A=E4=BA=BA=E9=83=BD=E6=98=AF=
=E9=97=AD=E7=9D=80=E7=9C=BC=E7=9D=9B=E7=9E=8E=E6=8A=A1=EF=BC=8C=E4=BB=96=E8=
=87=AA=E5=B7=B1=E5=8F=AF=E8=83=BD=E9=83=BD=E4=B8=8D=E7=9F=A5=E9=81=93=E8=A6=
=81=E7=A0=8D=E8=B0=81=EF=BC=8C=E6=89=80=E4=BB=A5=E9=82=A3=E8=BF=99=E7=A7=8D=
=E5=88=80=EF=BC=8C=E6=A0=B9=E6=9C=AC=E6=8A=A1=E4=B8=8D=E8=B5=B7=E6=9D=A5=E3=
=80=82</p>
<p>&nbsp;&nbsp;&nbsp; =E4=BD=86=E8=BF=99=E6=8A=8A=E5=88=80=E6=94=BE=E5=9C=
=A8=E5=A4=A7=E7=86=8A=E6=89=8B=E9=87=8C=EF=BC=8C=E5=8D=B4=E9=9D=9E=E5=B8=B8=
=E5=90=88=E9=80=82=EF=BC=8C=E5=9B=A0=E4=B8=BA=E4=BB=96=E8=BA=AB=E9=AB=98=E5=
=92=8C=E8=87=82=E9=95=BF=EF=BC=8C=E9=83=BD=E8=BF=9C=E8=B6=85=E4=BA=8E=E5=B8=
=B8=E4=BA=BA=E3=80=82</p>
<p>&nbsp;&nbsp;&nbsp;=20
=E5=A4=A7=E7=86=8A=E6=8B=BD=E7=9D=80=E5=88=80=E4=B8=8B=E8=BD=A6=E5=90=8E=EF=
=BC=8C=E5=8F=AA=E4=B8=80=E6=AD=A5=E5=B0=B1=E8=B4=B4=E5=88=B0=E4=BA=86=E5=A4=
=A7=E5=9E=8BSUV=E6=97=81=E8=BE=B9=EF=BC=8C=E5=8F=8C=E6=89=8B=E6=94=A5=E7=9D=
=80=E5=88=80=E6=9F=84=EF=BC=8C=E5=8A=A8=E4=BD=9C=E7=95=A5=E6=98=BE=E7=BC=93=
=E6=85=A2=E5=9C=B0=E5=90=91=E5=90=8E=E6=89=AC=E5=88=80=E5=90=8E=EF=BC=8C=E5=
=8F=8C=E8=87=82=E6=98=8E=E6=98=BE=E9=A1=BF=E6=8C=AB=E8=93=84=E5=8A=9B=E5=9C=
=B0=E5=90=91=E8=BD=A6=E5=86=85=E6=8A=A1=E5=8E=BB=E3=80=82</p>
<p>&nbsp;&nbsp;&nbsp; =E2=80=9C=E5=98=AD=EF=BC=81=E2=80=9D</p>
<p>&nbsp;&nbsp;&nbsp; =E4=B8=80=E5=88=80=E8=90=BD=EF=BC=8C=E9=95=BF=E5=88=
=80=E7=A0=8D=E5=9C=A8=E8=BD=A6=E8=BA=AB=E4=B8=8A=E5=8F=91=E5=87=BA=E7=9A=84=
=E4=B8=8D=E6=98=AF=E9=87=91=E5=B1=9E=E6=92=9E=E5=87=BB=E7=9A=84=E5=A3=B0=E9=
=9F=B3=EF=BC=8C=E8=80=8C=E6=98=AF=E5=A5=BD=E5=83=8F=E9=82=A3=E7=A7=8D=E7=94=
=A8=E7=9F=B3=E5=A4=B4=E7=A0=B8=E8=BD=A6=E9=97=A8=E6=9D=BF=E7=9A=84=E5=8A=A8=
=E9=9D=99=E3=80=82</p>
<p>&nbsp;&nbsp;&nbsp; =E2=80=9C=E5=93=97=E5=95=A6=EF=BC=81=E2=80=9D</p>
<p>&nbsp;&nbsp;&nbsp; =E8=BD=A6=E7=8E=BB=E7=92=83=E7=9B=B4=E6=8E=A5=E8=A2=
=AB=E7=A0=8D=E7=A2=8E=EF=BC=8C=E7=8B=AD=E9=95=BF=E7=9A=84=E5=88=80=E8=BA=AB=
=E6=8E=A2=E8=BF=9B=E4=BA=86=E8=BD=A6=E5=86=85=E3=80=82</p>
<p>&nbsp;&nbsp;&nbsp; =E4=B8=8E=E6=AD=A4=E5=90=8C=E6=97=B6=EF=BC=8C=E5=A4=
=A7=E7=86=8A=E8=BA=AB=E5=90=8E=E7=9A=84=E6=B1=BD=E8=BD=A6=E9=87=8C=E5=86=B2=
=E5=87=BA=E6=9D=A5=E4=B8=89=E4=B8=AA=E4=BA=BA=EF=BC=8C=E5=85=A8=E9=83=A8=E6=
=8B=BF=E7=9D=80=E7=A0=8D=E5=88=80=EF=BC=8C=E8=B8=A9=E7=9D=80=E5=AF=B9=E6=96=
=B9=E7=9A=84=E8=BD=A6=E9=97=A8=EF=BC=8C=E5=90=91=E8=BD=A6=E5=86=85=E4=B8=80=
=E9=A1=BF=E7=8C=9B=E7=A0=B8=E3=80=82</p>
<p>&nbsp;&nbsp;&nbsp;=20
=E8=BD=A6=E5=86=85=EF=BC=8C=E6=9D=9C=E8=83=9C=E6=98=8E=E7=9C=8B=E8=A7=81=E8=
=B7=9F=E9=93=81=E5=A1=94=E4=B8=80=E6=A0=B7=E7=9A=84=E5=A4=A7=E7=86=8A=E5=86=
=B2=E5=87=BA=E6=9D=A5=E5=90=8E=EF=BC=8C=E6=95=B4=E4=B8=AA=E4=BA=BA=E8=BF=98=
=E6=B2=A1=E7=AD=89=E4=B8=8B=E8=BD=A6=EF=BC=8C=E5=B0=B1=E5=9C=A8=E5=90=8E=E5=
=BA=A7=E8=A2=AB=E5=88=92=E4=BA=86=E4=B8=80=E5=88=80=E3=80=82=E4=BD=86=E4=BB=
=96=E5=8F=8D=E5=BA=94=E5=BE=88=E5=BF=AB=EF=BC=8C=E8=BA=AB=E4=BD=93=E5=8D=8A=
=E8=BA=BA=E7=9D=80=EF=BC=8C=E7=9B=B4=E6=8E=A5=E6=89=A3=E5=BC=80=E4=BA=86=E9=
=97=A8=E9=94=81=EF=BC=8C=E4=B8=80=E8=84=9A=E8=B8=B9=E5=BC=80=E4=BA=86=E8=BD=
=A6=E9=97=A8=E3=80=82</p>
<p>&nbsp;&nbsp;&nbsp; =E2=80=9C=E5=99=97=E5=97=A4=EF=BC=81=E2=80=9D</p>
<p>&nbsp;&nbsp;&nbsp; =E5=A4=A7=E7=86=8A=E4=BB=A5=E5=89=8D=E4=B9=9F=E6=98=
=AF=E7=8E=AF=E5=8D=AB=E5=8F=A3=E7=9A=84=EF=BC=8C=E4=BB=96=E6=98=AF=E8=A7=81=
=E8=BF=87=E6=9D=9C=E8=83=9C=E6=98=8E=E7=9A=84=EF=BC=8C=E4=B9=9F=E7=9F=A5=E9=
=81=93=E4=BB=96=E5=B0=B1=E6=98=AF=E9=A2=86=E5=A4=B4=E4=BA=BA=EF=BC=8C=E6=89=
=80=E4=BB=A5=E7=AB=99=E5=9C=A8=E5=A4=96=E9=9D=A2=EF=BC=8C=E5=86=8D=E6=AC=A1=
=E6=89=AC=E5=88=80=EF=BC=8C=E7=A0=8D=E5=9C=A8=E4=BA=86=E5=AF=B9=E6=96=B9=E7=
=9A=84=E5=A4=A7=E8=85=BF=E4=B8=8A=E3=80=82</p>
<p>&nbsp;&nbsp;&nbsp; =E6=9D=9C=E8=83=9C=E6=98=8E=E8=A2=AB=E5=A0=B5=E5=9C=
=A8=E8=BD=A6=E5=86=85=E5=90=83=E4=BA=86=E5=A4=A7=E4=BA=8F=EF=BC=8C=E6=8B=BF=
=E5=88=80=E5=90=91=E5=89=8D=E4=B8=80=E6=8D=85=EF=BC=8C=E9=80=BC=E9=80=80=E4=
=BA=86=E5=A4=A7=E7=86=8A=EF=BC=8C=E9=9A=8F=E5=8D=B3=E9=92=BB=E5=87=BA=E5=8E=
=BB=EF=BC=8C=E8=BA=AB=E4=BD=93=E9=9D=A0=E7=9D=80=E8=BD=A6=E8=BA=AB=EF=BC=8C=
=E6=8A=A1=E5=88=80=E7=A0=8D=E9=80=80=E4=BA=86=E4=B8=A4=E4=BA=BA=E3=80=82</p=
>
<p>&nbsp;&nbsp;&nbsp; =E2=80=9C=E4=BD=A0=E8=B8=8F=E9=A9=AC=E6=98=AF=E9=82=
=A3=E4=B8=AA=E9=80=83=E7=8A=AF=EF=BC=9F=EF=BC=81=E2=80=9D=E6=9D=9C=E8=83=9C=
=E6=98=8E=E8=A7=81=E8=BF=87=E5=A4=A7=E7=86=8A=E7=9A=84=E9=80=9A=E7=BC=89=E4=
=BB=A4=EF=BC=8C=E4=B8=80=E7=9C=BC=E5=B0=B1=E8=AE=A4=E5=87=BA=E4=BA=86=E4=BB=
=96=E3=80=82</p>
<p>&nbsp;&nbsp;&nbsp; =E5=A4=A7=E7=86=8A=E6=A0=B9=E6=9C=AC=E6=B2=A1=E6=9C=
=89=E7=90=86=E4=BC=9A=E5=AF=B9=E6=96=B9=EF=BC=8C=E5=8F=8C=E6=89=8B=E6=8F=A1=
=E5=88=80=EF=BC=8C=E5=A5=94=E7=9D=80=E6=9D=9C=E8=83=9C=E6=98=8E=E7=9A=84=E8=
=84=91=E8=A2=8B=E5=B0=B1=E7=A0=8D=E4=BA=86=E4=B8=8B=E5=8E=BB=E3=80=82</p>
<p>&nbsp;&nbsp;&nbsp; =E2=80=9C=E5=BD=93=E5=95=B7=EF=BC=81=E2=80=9D</p>
<p>&nbsp;&nbsp;&nbsp;=20
=E6=9D=9C=E8=83=9C=E6=98=8E=E4=B9=9F=E4=BC=9A=E4=B8=A4=E4=B8=8B=E5=AD=90=EF=
=BC=8C=E5=8F=8D=E5=BA=94=E5=BE=88=E5=BF=AB=E5=9C=B0=E6=8B=BF=E5=88=80=E4=B8=
=80=E6=9E=B6=EF=BC=8C=E4=BD=86=E7=AB=9F=E7=84=B6=E6=B2=A1=E6=9C=89=E6=9E=B6=
=E4=BD=8F=E3=80=82=E9=95=BF=E5=88=80=E5=8E=8B=E4=B8=8B=E6=9D=A5=EF=BC=8C=E6=
=89=93=E5=BE=97=E7=9F=AD=E5=88=80=E4=B8=8B=E5=9D=A0=EF=BC=8C=E5=89=8D=E8=80=
=85=E5=90=91=E5=B7=A6=E4=BE=A7=E4=B8=80=E8=BA=B2=EF=BC=8C=E8=84=B8=E9=A2=8A=
=E5=BD=93=E5=9C=BA=E8=A2=AB=E8=B1=81=E5=BC=80=E4=BA=86=E4=B8=80=E4=B8=AA=E5=
=A4=A7=E5=8F=A3=E5=AD=90=E3=80=82</p>
<p>&nbsp;&nbsp;&nbsp; =E5=A4=A7=E7=86=8A=E4=BB=97=E7=9D=80=E8=BA=AB=E4=BD=
=93=E7=B4=A0=E8=B4=A8=E7=88=86=E7=82=B8=EF=BC=8C=E9=80=80=E5=90=8E=E4=B8=80=
=E6=AD=A5=EF=BC=8C=E6=89=AC=E5=88=80=E5=86=8D=E7=A0=8D=E3=80=82</p>
<p>&nbsp;&nbsp;&nbsp; =E6=9D=9C=E8=83=9C=E6=98=8E=E5=8F=91=E7=8E=B0=E7=9C=
=BC=E5=89=8D=E8=BF=99=E4=B8=AA=E5=B0=8F=E5=AD=90=E5=A4=AA=E6=A5=9E=EF=BC=8C=
=E8=80=8C=E4=B8=94=E6=89=8B=E5=8A=B2=E6=9E=81=E5=A4=A7=EF=BC=8C=E6=89=80=E4=
=BB=A5=E6=B2=A1=E6=9C=89=E9=80=89=E6=8B=A9=E7=A1=AC=E6=8B=BC=EF=BC=8C=E5=86=
=8D=E6=AC=A1=E6=8B=89=E5=BC=80=E8=BA=AB=E4=BD=8D=E4=B8=80=E8=BA=B2=EF=BC=8C=
=E5=8F=B3=E6=89=8B=E4=B8=80=E5=88=80=E7=A0=8D=E5=90=91=E5=A4=A7=E7=86=8A=E7=
=9A=84=E8=85=BF=E9=83=A8=E3=80=82</p>
<p>&nbsp;&nbsp;&nbsp; =E2=80=9C=E5=98=AD=EF=BC=81=E2=80=9D</p>
<p>&nbsp;&nbsp;&nbsp;=20
=E5=A4=A7=E7=86=8A=E5=9B=9E=E5=88=80=E8=B0=83=E6=95=B4=E4=BD=8D=E7=BD=AE=E7=
=9A=84=E6=97=B6=E5=80=99=EF=BC=8C=E8=BA=AB=E4=BD=93=E7=AC=A8=E9=87=8D=E5=9C=
=B0=E6=8A=AC=E8=B5=B7=E4=B8=80=E8=84=9A=E8=B8=B9=E5=9C=A8=E4=BA=86=E6=9D=9C=
=E8=83=9C=E6=98=8E=E7=9A=84=E8=BA=AB=E4=B8=8A=E3=80=82=E5=90=8E=E8=80=85=E9=
=80=80=E4=BA=86=E4=B8=A4=E6=AD=A5=EF=BC=8C=E8=80=8C=E5=A4=A7=E7=86=8A=E7=9A=
=84=E5=8F=B3=E8=85=BF=E4=B9=9F=E8=A2=AB=E5=88=80=E5=88=83=E5=88=92=E4=BC=A4=
=E3=80=82=E4=B8=8D=E8=BF=87=E8=BF=99=E4=B8=80=E5=88=80=E7=A0=8D=E5=9C=A8=E4=
=BB=96=E7=B2=97=E5=A3=AE=E7=9A=84=E5=A4=A7=E8=85=BF=E4=B8=8A=EF=BC=8C=E5=B9=
=B6=E6=B2=A1=E6=9C=89=E5=BD=B1=E5=93=8D=E4=BB=96=E7=9A=84=E8=A1=8C=E5=8A=A8=
=E5=8A=9B=E3=80=82</p>
<p>&nbsp;&nbsp;&nbsp; =E6=9D=9C=E8=83=9C=E6=98=8E=E6=9C=89=E7=82=B9=E6=87=
=B5=E5=95=8A=EF=BC=8C=E4=BB=96=E7=A0=8D=E5=AF=B9=E6=96=B9=E4=B8=80=E5=88=80=
=EF=BC=8C=E8=BA=AB=E9=AB=98=E4=B8=80=E7=B1=B3=E4=B9=9D=E5=8D=81=E5=A4=9A=E7=
=9A=84=E5=A4=A7=E7=86=8A=EF=BC=8C=E8=BF=9E=E6=99=83=E6=82=A0=E9=83=BD=E4=B8=
=8D=E5=B8=A6=E6=99=83=E6=82=A0=E7=9A=84=E3=80=82</p>
<p>&nbsp;&nbsp;&nbsp;=20
=E2=80=9C=E2=80=A6=E2=80=A6=E4=BB=8A=E5=A4=A9=E2=80=A6=E2=80=A6=E4=BB=8A=E5=
=A4=A9=E6=9C=89=E6=88=91=E5=9C=A8=EF=BC=8C=E9=95=BF=E6=B8=85=E4=B8=80=E4=B8=
=AA=E4=BA=BA=E9=83=BD=E8=BF=87=E4=B8=8D=E5=8E=BB=E6=A1=90=E6=9E=97=E6=A1=A5=
=EF=BC=81=E2=80=9D=E5=A4=A7=E7=86=8A=E7=9E=AA=E7=9D=80=E7=9C=BC=E7=8F=A0=E5=
=AD=90=EF=BC=8C=E5=8F=8C=E6=89=8B=E6=8F=A1=E5=88=80=E5=90=91=E4=B8=8B=E7=A0=
=8D=EF=BC=9A=E2=80=9C=E5=88=AB=E8=AF=B4=E4=BD=A0=E4=BA=86=EF=BC=8C=E5=B0=B1=
=E6=98=AF=E5=86=8D=E6=9D=A5=E4=BA=94=E4=B8=AA=E8=AD=A6=E5=91=98=EF=BC=8C=E6=
=88=91=E4=B9=9F=E6=95=A2=E6=95=B4=E6=AD=BB=E4=BB=96=E3=80=82=E2=80=9D</p>
<p>&nbsp;&nbsp;&nbsp; =E2=80=9C=E5=BD=93=E5=95=B7=EF=BC=81=E2=80=9D</p>
<p>&nbsp;&nbsp;&nbsp; =E6=9D=9C=E8=83=9C=E6=98=8E=E6=9E=B6=E4=BA=86=E4=B8=
=80=E4=B8=8B=E5=88=80=EF=BC=8C=E8=BD=AC=E8=BA=AB=E5=90=8E=E9=80=80=E3=80=82=
</p>
<p>&nbsp;&nbsp;&nbsp; =E8=BF=99=E6=97=B6=EF=BC=8C=E9=95=BF=E6=B8=85=E9=98=
=9F=E4=BC=8D=E5=B0=BE=E9=83=A8=E7=9A=84=E5=8D=81=E5=87=A0=E4=B8=AA=E4=BA=BA=
=EF=BC=8C=E8=A7=81=E5=88=B0=E6=9D=9C=E8=83=9C=E6=98=8E=E8=A2=AB=E5=B9=B2=EF=
=BC=8C=E5=85=A8=E9=83=BD=E8=B7=91=E4=BA=86=E5=9B=9E=E6=9D=A5=E3=80=82</p>
<p>&nbsp;&nbsp;&nbsp; =E5=A4=A7=E7=86=8A=E7=AB=99=E5=9C=A8=E4=BA=BA=E7=BE=
=A4=E5=A4=96=E5=9B=B4=EF=BC=8C=E8=BA=AB=E4=BD=93=E5=8A=A8=E4=BD=9C=E7=BC=93=
=E6=85=A2=EF=BC=8C=E4=BD=86=E5=8D=B4=E5=88=80=E9=87=8D=EF=BC=8C=E4=BA=BA=E7=
=8B=A0=E3=80=82</p>
<p>&nbsp;&nbsp;&nbsp; =E4=B8=89=E5=9B=9B=E4=B8=AA=E4=BA=BA=E5=9B=B4=E4=B8=
=8A=E6=9D=A5=EF=BC=8C=E5=A4=A7=E7=86=8A=E7=AB=99=E5=9C=A8=E9=A9=AC=E8=B7=AF=
=E7=89=99=E5=AD=90=E4=B8=8A=E4=BE=A7=EF=BC=8C=E8=BA=AB=E4=BD=93=E5=89=8D=E5=
=80=BE=E7=9D=80=E5=8E=8B=E8=BF=AB=E6=84=9F=E5=8D=81=E8=B6=B3=EF=BC=8C=E5=8F=
=8C=E6=89=8B=E6=A8=AA=E6=8A=A1=E7=A0=8D=E5=88=80=EF=BC=8C=E7=9B=B4=E6=8E=A5=
=E4=B8=80=E5=88=80=E5=89=81=E5=80=92=E4=BA=86=E5=AF=B9=E6=96=B9=E4=B8=A4=E4=
=BA=BA=E3=80=82</p>
<p>&nbsp;&nbsp;&nbsp; =E4=B8=A4=E4=BA=BA=E5=90=8E=E9=80=80=EF=BC=8C=E8=83=
=B8=E5=89=8D=EF=BC=8C=E8=83=B3=E8=86=8A=E4=B8=8A=EF=BC=8C=E6=B3=9B=E8=B5=B7=
=E4=BA=86=E8=A1=80=E6=B7=8B=E6=B7=8B=E7=9A=84=E5=A4=A7=E5=8F=A3=E5=AD=90=E3=
=80=82</p>
<p>&nbsp;&nbsp;&nbsp; =E5=A4=A7=E7=86=8A=E9=AA=91=E7=9D=80=E5=AF=B9=E6=96=
=B9=E5=9B=9B=E4=B8=AA=E4=BA=BA=EF=BC=8C=E6=8A=A1=E5=88=80=E5=86=8D=E7=A0=8D=
=E3=80=82</p>
<p>&nbsp;&nbsp;&nbsp; =E2=80=9C=E5=99=97=E5=97=A4=EF=BC=81=E2=80=9D</p>
<p>&nbsp;&nbsp;&nbsp; =E5=AF=B9=E6=96=B9=E4=B8=A4=E4=BA=BA=E9=A3=99=E8=A1=
=80=EF=BC=8C=E8=BA=AB=E4=BD=93=E5=90=91=E5=90=8E=E8=BA=B2=E9=81=BF=E6=97=B6=
=EF=BC=8C=E8=84=9A=E4=B8=8B=E5=A4=B1=E5=8E=BB=E5=B9=B3=E8=A1=A1=EF=BC=8C=E7=
=9B=B4=E6=8E=A5=E5=80=92=E5=9C=B0=E3=80=82</p>
<p>&nbsp;&nbsp;&nbsp; 19=E5=B2=81=EF=BC=8C=E8=B5=B0=E6=8A=95=E6=97=A0=E8=B7=
=AF=EF=BC=8C=E6=97=A0=E5=AE=B6=E5=8F=AF=E5=BD=92=EF=BC=8C=E8=A2=AB=E9=80=BC=
=E6=97=A0=E5=A5=88=E4=B8=8B=EF=BC=8C=E8=BF=9E=E6=9D=80=E4=BA=94=E5=90=8D=E4=
=BD=9C=E6=81=B6=E5=A4=9A=E7=AB=AF=E7=9A=84=E9=BB=91=E8=AD=A6=EF=BC=8C=E5=B7=
=B2=E7=84=B6=E5=86=8D=E6=97=A0=E5=9B=9E=E5=A4=B4=E4=B9=8B=E8=B7=AF=E3=80=82=
</p>
<p>&nbsp;&nbsp;&nbsp; =E5=88=B0=E4=BA=86=E8=BF=99=E4=B8=AA=E4=BB=BD=E4=B8=
=8A=EF=BC=8C=E5=A4=A7=E7=86=8A=E5=B7=B2=E7=BB=8F=E6=B2=A1=E6=9C=89=E4=BB=BB=
=E4=BD=95=E7=89=B5=E6=8C=82=E4=BA=86=E3=80=82=E8=BF=99=E6=AC=A1=E5=9B=9E=E9=
=BE=99=E5=9F=8E=EF=BC=8C=E8=8B=8F=E5=A4=A9=E5=BE=A1=E6=98=AF=E4=B8=8D=E5=90=
=8C=E6=84=8F=E7=9A=84=EF=BC=8C=E4=BD=86=E4=BB=96=E8=BF=98=E6=98=AF=E7=A1=AC=
=E8=B7=9F=E4=BA=86=E5=9B=9E=E6=9D=A5=E3=80=82</p>
<p>&nbsp;&nbsp;&nbsp; =E4=BB=96=E5=98=B4=E7=AC=A8=E7=BB=93=E5=B7=B4=EF=BC=
=8C=E4=B9=9F=E4=B8=8D=E4=BC=9A=E8=AF=B4=E4=BB=80=E4=B9=88=EF=BC=8C=E4=BD=86=
=E6=B0=B8=E8=BF=9C=E6=84=9F=E6=BF=80=E8=8B=8F=E5=A4=A9=E5=BE=A1=E5=9C=A8=E4=
=BB=96=E6=9C=80=E9=9A=BE=E7=9A=84=E6=97=B6=E5=80=99=EF=BC=8C=E4=BC=B8=E5=87=
=BA=E6=9C=80=E6=B8=A9=E6=9A=96=E7=9A=84=E7=9A=84=E9=82=A3=E5=8F=AA=E6=89=8B=
=E3=80=82</p>
<p>&nbsp;&nbsp;&nbsp; =E4=BB=8A=E6=97=A5=E5=BD=92=E6=9D=A5=EF=BC=8C=E5=A4=
=A7=E7=86=8A=E6=98=AF=E5=A5=94=E7=9D=80=E7=8E=A9=E5=91=BD=E6=9D=A5=E7=9A=84=
=E3=80=82</p>
<p>&nbsp;&nbsp;&nbsp; =E8=87=B3=E6=AD=A4=EF=BC=8C=E6=9C=AA=E6=9D=A5=E6=9F=
=90=E5=8D=8E=E4=BA=BA=E7=BB=84=E7=BB=87=E5=8D=8F=E4=BC=9A=EF=BC=8C=E6=9C=80=
=E7=8C=9B=E7=9A=84=E5=8F=8C=E8=8A=B1=E7=BA=A2=E6=A3=8D=EF=BC=8C=E4=BB=8A=E6=
=97=A5=E6=AD=A3=E5=BC=8F=E5=87=BA=E9=81=93=EF=BC=81</p>
<p>&nbsp;&nbsp;&nbsp; =E2=80=A6=E2=80=A6</p>
<p>&nbsp;&nbsp;&nbsp; =E4=BD=99=E5=AE=B6=E5=88=AB=E8=8B=91=E9=97=A8=E5=8F=
=A3=E3=80=82</p>
<p>&nbsp;&nbsp;&nbsp;=20
=E4=B8=80=E5=8F=B0=E7=A7=81=E5=AE=B6=E8=BD=A6=E5=81=9C=E6=BB=9E=EF=BC=8C=E4=
=B8=A4=E5=90=8D=E4=B8=AD=E5=B9=B4=E8=BF=88=E6=AD=A5=E8=B5=B0=E8=BF=9B=E4=BA=
=86=E5=A4=A7=E9=99=A2=E5=86=85=EF=BC=8C=E5=9C=A8=E4=BD=99=E9=94=A6=E8=8D=A3=
=E4=BA=B2=E8=87=AA=E8=BF=8E=E6=8E=A5=E4=B8=8B=EF=BC=8C=E5=9D=90=E5=9C=A8=E4=
=BA=86=E9=9B=A8=E4=BC=9E=E4=B8=8B=E9=9D=A2=E3=80=82</p></font></body></html=
>

