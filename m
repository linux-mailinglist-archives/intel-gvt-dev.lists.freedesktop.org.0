Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8360B286433
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  7 Oct 2020 18:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 304638932B;
	Wed,  7 Oct 2020 16:31:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from sonic305-2.consmr.mail.bf2.yahoo.com
 (sonic305-2.consmr.mail.bf2.yahoo.com [74.6.133.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79AD8932B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  7 Oct 2020 16:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1602088303; bh=PxMwWzXvs+dqOoH0/FHvFmQpYH2JguaCUHYAVLLmaiw=;
 h=Date:From:Reply-To:Subject:References:From:Subject;
 b=C2CTlAID32TrDiNTm+YcHSLAFg/4t9GbTNa0kKfJTQm3Eqc4GZj4FRVd6AtgIqDyQlWnXLB/Tji+CtW3+JpgvuI4b0RxVSrQ2uNMfi2rJ+vqfPFDaGMDAJY2SsSDQywkDCbhyo0g5Iq6sAM4ECGrs0jYYxtQ27Wb9hFqF7OBUPktpU82nnVFivjD1asjpsbYPwn3/F9M9EpVPbVvKuF9rF7lIrm48IraoFMEHm4EXL9qariqrbsloze0FNnUDkA+E1nz/X2CycEWPj2dNyBrY9cKkRnhRCaf5r4Q45zysQYRj5Rvn3RoV30zvGocXhCRQC372N+uCInKWnTov7yxhg==
X-YMail-OSG: lpGfp38VM1k9L7ZGPf.gkDDSY63m2JYZzKShr8D9XAOXCYJmUBBkWPGQF8z8n6A
 GgN.O45iNGMmt7dwGMQ3np.eV.phhHadtX0k9IJSeG0DHXqgCx5WE5SRFIc2gDj_NuMWT5Kdh2I4
 dm9lE_Ug5oEbCvMTFc7LjcdYdbBxrYWEeOeQ_68Dmrn97UXJ8wySgaaY0wihTXQQuUCwidFsS3vt
 _NpSbZg3kBIUybAlodIusBgKbDqaD4ZKD_6m5rQ6NaCqXY.RndUiE81cCqNcrHJqYWIB8dJ2zpia
 YmjhkAiJ5gsNwjs27j_RaL9lHbMmTfows07JepdlKigKlc71bG7aDGdgUQ9CITJlkvchc7GL7KZG
 RozUQlzjodLZoH1WbRQft5E97Jw1.KNXEyq3W1z3MqLWqrXl2cHXhEci_wyeANKXvNlEN7KVFp8I
 fCk0QcE4JHQP1gBVWycMUrtT1wej9Cr8QRKQN0WkrWK.n.UoY5ePg8FNXrICSlWixZqzBcWkHfpv
 ezguTRJ75dXqRMff_NJ0eEBqYL61TwRE5mMQhnIZrWCfJkdAIw.SQSjklddjdEMMmXlZEc0L9nPZ
 HY004Bgku7YWY4jhhIKDcLpHw1Z7VmAErSY0gdlUt0Wblg4gSgZGkxcaKZLgdtGL1jDPiEBfZNQl
 qS2.KCKCw_HP30cb28.zdRPSy2CAm8J7pY31paSYjJRcVYkT3uQykWazrKdaZL_DXzLvqa.cGokB
 egq7uzh6jXPCInpDcVTUiDwcUx8F1sTBDLu951OBLps_mcHYXu8F.baS8NuZwpibAkfjk.FPx_zS
 .MkaDqZFZnfuikCED6xAbEcc7St4WAAOU3g7fv_x0eOTmat__3We7v2hX7KQ5tOvZ9FT.2U9Fukk
 bJfBdfnknxf0bgVRavBWojfHtoI_km_qsLRI0uyGevFa8ZvAQWzemnnvRexwSIgYXQ.GCVDtSqlL
 LlvWczVn2_8QN2ISAmYXjvbQiBJfRKWe_zsu1FWwe72d1MGjcAADC9qDMKZrL.ulyQVEwPZJ_aUV
 5KQlWHHLBUtmxCKm.DZS.KKq4_FFFgbCKb4EIFycDK4vd9fe_F8Jdj_bI7o1lNVpJvrWDldMQFmq
 hobhusHZxeIneZzvwCZwf3lpsaDqxdHXliGnpL4BiKXb23AjmRqNGa2qDdzd_52vrBJv7BANQqeB
 PCa5.nzKXeVLh6uUu8u02pQnvLC8XfdojH0f9rzzTkYVKNcd7zzldDL4f._INAaDGkYTJOZJ_GHo
 4aO3X3nNFI69Ir9X837d3mbo10ZPJgat6Mgpfnp1_BVzmCpys_nqhVZiLz9N93mt889M8j2RJvUo
 xZF0r0W1Yx1dT_8QGB7I2k8msP7MZUqSUNjArs3Xr7_SAm3q0hNqGA8cmZryasvNQf_ttLvbYwCO
 m0TXHg_OmKIAoeU_8KYdc6LQAOnrWxg5gYjcK9WaFnims
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic305.consmr.mail.bf2.yahoo.com with HTTP; Wed, 7 Oct 2020 16:31:43 +0000
Date: Wed, 7 Oct 2020 16:31:35 +0000 (UTC)
From: Marilyn Robert <fredodinga22@gmail.com>
Message-ID: <888166675.146654.1602088295264@mail.yahoo.com>
Subject: =?UTF-8?B?0J3QsNGY0LzQuNC70LAg0LrQsNGYINCz0L7RgdC/0L7QtNCw0YDQvtGC?=
MIME-Version: 1.0
References: <888166675.146654.1602088295264.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16795 YMailNodin Mozilla/5.0 (Windows NT 6.1)
 AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36
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
Reply-To: marilyobert@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

DQoNCtCd0LDRmNC80LjQu9CwINC60LDRmCDQs9C+0YHQv9C+0LTQsNGA0L7Rgg0KDQrQiNCw0YEg
0YHRg9C8IDY4LdCz0L7QtNC40YjQvdCwINC20LXQvdCwLCDQutC+0ZjQsCDRgdGC0YDQsNC00LAg
0L7QtCDQv9GA0L7QtNC+0LvQttC10L0g0LrQsNGA0YbQuNC90L7QvCDQvdCwINC00L7RmNC60LAs
INC+0LQg0YHQuNGC0LUg0LzQtdC00LjRhtC40L3RgdC60Lgg0LjQvdC00LjQutCw0YbQuNC4LCDQ
vNC+0ZjQsNGC0LAg0YHQvtGB0YLQvtGY0LHQsCDQvdCw0LLQuNGB0YLQuNC90LAg0YHQtSDQstC7
0L7RiNC4INC4INC+0YfQuNCz0LvQtdC00L3QviDQtSDQtNC10LrQsCDQvNC+0LbQtdCx0Lgg0L3Q
tdC80LAg0LTQsCDQttC40LLQtdCw0Lwg0L/QvtCy0LXRnNC1INC+0LQg0YjQtdGB0YIg0LzQtdGB
0LXRhtC4INC60LDQutC+INGA0LXQt9GD0LvRgtCw0YIg0L3QsCDQsdGA0LfQuNC+0YIg0YDQsNGB
0YIg0Lgg0LHQvtC70LrQsNGC0LAg0YjRgtC+INGB0LUg0ZjQsNCy0YPQstCwINC60LDRmCDQvdC1
0LAuINCc0L7RmNC+0YIg0YHQvtC/0YDRg9CzINC/0L7Rh9C40L3QsCDQvdC10LrQvtC70LrRgyDQ
s9C+0LTQuNC90Lgg0L3QsNC90LDQt9Cw0LQg0Lgg0L3QsNGI0LjRgtC1INC00L7Qu9Cz0Lgg0LPQ
vtC00LjQvdC4INCx0YDQsNC6INC90LUg0LHQtdCwINCx0LvQsNCz0L7RgdC70L7QstC10L3QuCDR
gdC+INC90LjRgtGDINC10LTQvdC+INC00LXRgtC1LCDQv9C+INC90LXQs9C+0LLQsNGC0LAg0YHQ
vNGA0YIg0LPQviDQvdCw0YHQu9C10LTQuNCyINGG0LXQu9C+0YLQviDQvdC10LPQvtCy0L4g0LHQ
vtCz0LDRgtGB0YLQstC+Lg0KDQrQlNC+0LDRk9Cw0Lwg0LrQsNGYINCy0LDRgSDQvtGC0LrQsNC6
0L4g0YHQtSDQv9C+0LzQvtC70LjQsiDQt9CwINGC0L7QsCwg0L/QvtC00LPQvtGC0LLQtdC9INGB
0YPQvCDQtNCwINC00L7QvdC40YDQsNC8INGB0YPQvNCwINC+0LQgMiwgMzAwLCAwMDAg0LXQstGA
0LAg0LfQsCDQv9C+0LzQvtGIINC90LAg0YHQuNGA0L7QvNCw0YjQvdC40YLQtSwg0YHQuNGA0L7Q
vNCw0YjQvdC40YLQtSDQuCDQv9C+0LzQsNC70LrRgyDQv9GA0LjQstC40LvQtdCz0LjRgNCw0L3Q
uNGC0LUg0LzQtdGT0YMg0LLQsNGI0LjRgtC1INGB0L7QsdGA0LDQvdC40ZjQsCAvINC+0L/RiNGC
0LXRgdGC0LLQvi4g0JfQsNCx0LXQu9C10LbQtdGC0LUg0LTQtdC60LAg0L7QstC+0Zgg0YTQvtC9
0LQg0LUg0LTQtdC/0L7QvdC40YDQsNC9INCy0L4g0LHQsNC90LrQsCDQutCw0LTQtSDRiNGC0L4g
0YDQsNCx0L7RgtC10YjQtSDQvNC+0ZjQvtGCINGB0L7Qv9GA0YPQsy4gQXBwcmVjaWF0ZdC1INGG
0LXQvdCw0Lwg0LDQutC+INC+0LHRgNC90LXRgtC1INCy0L3QuNC80LDQvdC40LUg0L3QsCDQvNC+
0LXRgtC+INCx0LDRgNCw0ZrQtSDQt9CwINC/0YDQvtC/0LDQs9C40YDQsNGa0LUg0L3QsCDQvNCw
0YHQsNC20LDRgtCwINC90LAg0LrRgNCw0LvRgdGC0LLQvtGC0L4sINGc0LUg0LLQuCDQtNCw0LTQ
sNC8INC/0L7QstC10ZzQtSDQtNC10YLQsNC70Lgg0LfQsCDRgtC+0LAg0LrQsNC60L4g0LTQsCDQ
v9C+0YHRgtCw0L/QuNGC0LUuDQoNCtCR0LvQsNCz0L7QtNCw0YDQsNC8DQrQky3Rk9CwINCc0LXR
gNC40LvQuNC9INCg0L7QsdC10YDRggpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2ludGVsLWd2dC1kZXYK
