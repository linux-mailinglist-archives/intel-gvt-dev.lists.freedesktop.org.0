Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F585ACCCD
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  5 Sep 2022 09:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1511A10E1E1;
	Mon,  5 Sep 2022 07:35:21 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B27F10E1E4;
 Mon,  5 Sep 2022 07:35:18 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id 29so5095879edv.2;
 Mon, 05 Sep 2022 00:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=/sDanSkrLwd36MY8AyWYKOjcXxKpP3tgOSmTp+6QTpA=;
 b=D/bBnkuE93UwNwWjPCKQjpa3enQb+Sk7crUitNvT11RCoUTD1MApkmLPiuIK2sUgqJ
 bAdjS05gx0CiHnYRVMBYm0/WDjVbvF23aA4eT0RFe/i/vuE7d7C1TFwk0arifEV1PgUK
 GwKTtJz2NnWBJxRVx8r6/5+idCJ3UdvRDEe9afXkxTdjZ2R/43YAqisRJshgwGhVzYOf
 dCez6/QWlMAYS4m2r0URGkWY6gmPiY19KGn03Ajj8XzJ6V4EYN/wNaIobWVuQ9gbS1Zh
 H5zHbyi8PBS+I7MiyWHlG6zbUNR0647HM7YPjyQHIdA8X1jps/pECgr6sVL/Ai8l0m2j
 p1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=/sDanSkrLwd36MY8AyWYKOjcXxKpP3tgOSmTp+6QTpA=;
 b=07LXlkLPnqZ/IEJSAPXWYhBQzc9wYD15D1d4JN8xpuWpCeMTi+DijURCPRrzKQNjA+
 zR7lhuF00UTiBK4l9LA1v2BHACwgZKknZO7R4sIsY9h60ng0BmIOkCv7tp08fOK4uo9i
 YvQwS5bHjxW2vKTfPLnxeoik+LKHg0sUXYLPMCc0UqH1VOngFnXQQDx6AJsUz4fguatM
 g2lBVBvjgK3ApQxT/4zVfk5P5wKd7Fvdkn1wJPhQpHA7nO9kDwPehCY82y1+zdrPM9jp
 MMqNNZisuZgNV8DkugPZq+8C+QeXNEuED9ua6Um20K+oYKo9QNe7cuTxhH1Pys5gSNJF
 918A==
X-Gm-Message-State: ACgBeo1GqQHa8OltONA8orddnS1TsoxLv+z8jam/iFvFvVXBRL9WALLi
 mVzq+prkNj+bIHWETn3RjMRnntXVSoEblmyvlB928SDJhcdugVG0aWI=
X-Google-Smtp-Source: AA6agR41iyuJkZAANMHnLfL8buddmIIsx+cWKwI51aE5VjNWB3uDrqvsCwjulFFkiVv6eU+BBcwjlyGi514bcEIlYok=
X-Received: by 2002:a50:ef03:0:b0:44e:82bf:28e6 with SMTP id
 m3-20020a50ef03000000b0044e82bf28e6mr3074811eds.270.1662363316620; Mon, 05
 Sep 2022 00:35:16 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_E1BBF05904DFB73C478DCD592740AAE0780A@qq.com>
 <CAJedcCxVW++iH49UFZp9ruUuTcNubWCH6Wsqe11K4COB3E8msg@mail.gmail.com>
In-Reply-To: <CAJedcCxVW++iH49UFZp9ruUuTcNubWCH6Wsqe11K4COB3E8msg@mail.gmail.com>
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Mon, 5 Sep 2022 15:35:05 +0800
Message-ID: <CAJedcCw1eJqjSK+yR7eQMDheNtH3Mjm+viwt00xAhnmrfpq2pw@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/gvt: fix double-free bug in split_2MB_gtt_entry.
To: xmzyshypnc <1002992920@qq.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: alex000young@gmail.com, security@kernel.org,
 dri-devel@lists.freedesktop.org, tvrtko.ursulin@linux.intel.com,
 airlied@linux.ie, Greg KH <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, joonas.lahtinen@linux.intel.com,
 linux-kernel@vger.kernel.org, jani.nikula@linux.intel.com,
 zhenyuw@linux.intel.com, daniel@ffwll.ch, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, zhi.a.wang@intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hi everyone,
Now the letter is really plain-text now :)
Thanks Greg

Regards,
Zheng Wang

Zheng Hacker <hackerzheng666@gmail.com> =E4=BA=8E2022=E5=B9=B49=E6=9C=885=
=E6=97=A5=E5=91=A8=E4=B8=80 12:47=E5=86=99=E9=81=93=EF=BC=9A
>
> Hello everyone,
>
> I'm Zheng Wang. I found a potential double-free bug in drivers/gpu/drm/i9=
15/gvt/gtt.c. I haven't been replied for a long time. So I decided to send =
it to more relavent supporters and developers to help to solve the problem.
>
> Best regards,
> Zheng Wang.
>
> xmzyshypnc <1002992920@qq.com> =E4=BA=8E2022=E5=B9=B49=E6=9C=884=E6=97=A5=
=E5=91=A8=E6=97=A5 20:32=E5=86=99=E9=81=93=EF=BC=9A
>>
>> There is a double-free security bug in split_2MB_gtt_entry.
>>
>> Here is a calling chain : ppgtt_populate_spt->ppgtt_populate_shadow_entr=
y->split_2MB_gtt_entry. If intel_gvt_dma_map_guest_page failed, it will cal=
l  ppgtt_invalidate_spt, which will finally call ppgtt_free_spt and kfree(s=
pt). But the caller does not notice that, and it will call ppgtt_free_spt a=
gain in error path.
>>
>> Fix this by returning the result of ppgtt_invalidate_spt to split_2MB_gt=
t_entry.
>>
>> Signed-off-by: Zheng Wang <1002992920@qq.com>
>> ---
>>  drivers/gpu/drm/i915/gvt/gtt.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/g=
tt.c
>> index ce0eb03709c3..9f14fded8c0c 100644
>> --- a/drivers/gpu/drm/i915/gvt/gtt.c
>> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
>> @@ -1215,7 +1215,7 @@ static int split_2MB_gtt_entry(struct intel_vgpu *=
vgpu,
>>                 ret =3D intel_gvt_dma_map_guest_page(vgpu, start_gfn + s=
ub_index,
>>                                                    PAGE_SIZE, &dma_addr)=
;
>>                 if (ret) {
>> -                       ppgtt_invalidate_spt(spt);
>> +                       ret =3D ppgtt_invalidate_spt(spt);
>>                         return ret;
>>                 }
>>                 sub_se.val64 =3D se->val64;
>> --
>> 2.25.1
>>
