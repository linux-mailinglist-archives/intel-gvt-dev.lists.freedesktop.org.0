Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B246D8154
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  5 Apr 2023 17:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E1110E9E7;
	Wed,  5 Apr 2023 15:14:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB25910E9D3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  5 Apr 2023 15:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680707684;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MSbeq35rqJ3WHS2Hi/jg4P1mAmdjaUY8F18xUXAczgA=;
 b=Vb28R4uloxg+h941jR5GKUiprHdRWryytaMtEEJCqSeIOdNfLe18fcJog9F1SO/hSMyQBu
 L0wFR+Lfs6iCPurrHunvIxgkZzmO5pRNV5tdsUgoFVU7w/Y24kplqEYU0umfWZol/Xk+c6
 UEl7dXZ6OhU8hcnJxK3tA6DlkDf6yKQ=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-TJE8MyaRM1qoScMInecHAw-1; Wed, 05 Apr 2023 11:14:43 -0400
X-MC-Unique: TJE8MyaRM1qoScMInecHAw-1
Received: by mail-qt1-f200.google.com with SMTP id
 p22-20020a05622a00d600b003e38f7f800bso24307677qtw.9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 05 Apr 2023 08:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680707682;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MSbeq35rqJ3WHS2Hi/jg4P1mAmdjaUY8F18xUXAczgA=;
 b=yOLQ4OyEeRSONwz6eIAdycim8KilTp6R7MpI8b1T4HaXqN725FNUZRRYU7YvEf67cv
 BAxnwxUJ91vwgyZiO3bPX3z3v/naU0mrHLHROO5AQfNGod4KIj4fDXGoEmMgPoJzUME5
 v5ntlnFh0Ky/sZIyy0snaosiz2tlLSelqFKQ3dtK8KRR/aY6LlAqBeK+cKIHom8vsToC
 XdTK6QYmQcn3O1tkVi2Krsntpf3VoOhxZ4j0PAH+1Cn2OwZIYr7rI/Xgv/Ivc+2rgulL
 qJ14v6OsSu/Q5b2GJVPSm3H/45n4MeB+95lB3EZsmOR41lZXDXUvaKi5IJrkvKZhkQzp
 iDqw==
X-Gm-Message-State: AAQBX9dbzUcq082cfpx1/2fAAfpcZMo2UIUWncqBl6LyJHVYxo5wd0LY
 mC5FydEEtPH8SDPLtHRZ2XoKc05z1Pb3kDaTLOdlMUZOXU3t6iJMahblnEiFdenlOF7lJOyt8b2
 +PPr75pkUGZONwmFYDwjjeR7Yl5b/e6y7VA==
X-Received: by 2002:ac8:5cc5:0:b0:3d6:ff99:7e9e with SMTP id
 s5-20020ac85cc5000000b003d6ff997e9emr5229931qta.33.1680707682476; 
 Wed, 05 Apr 2023 08:14:42 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zlgevm6Gpp8gQwtyz6Xv8+LMvLwjE1yHVNcDW2XGpmSXvtrNr59FUgRAfBeWw7meygfbGx0A==
X-Received: by 2002:ac8:5cc5:0:b0:3d6:ff99:7e9e with SMTP id
 s5-20020ac85cc5000000b003d6ff997e9emr5229887qta.33.1680707682097; 
 Wed, 05 Apr 2023 08:14:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 i19-20020ac87653000000b003e38e2815a5sm4031551qtr.22.2023.04.05.08.14.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 08:14:39 -0700 (PDT)
Message-ID: <48208e9e-2721-bea5-3a5e-852e32185d34@redhat.com>
Date: Wed, 5 Apr 2023 17:14:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 02/12] vfio/pci: Only check ownership of opened devices
 in hot reset
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20230401144429.88673-1-yi.l.liu@intel.com>
 <20230401144429.88673-3-yi.l.liu@intel.com>
 <844faa5c-2968-2a4f-8a70-900f359be1a0@redhat.com>
 <DS0PR11MB75290339DD0FD467146D4655C3939@DS0PR11MB7529.namprd11.prod.outlook.com>
 <fc87191d-2e79-83c3-b5ba-7f8b1083988a@redhat.com>
 <DS0PR11MB7529441450FE32DC9578C6B8C3939@DS0PR11MB7529.namprd11.prod.outlook.com>
 <5781064c-8742-d37d-57dc-7a7238e948d5@redhat.com>
 <ZC1eg8ZqwkfKuTDx@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <ZC1eg8ZqwkfKuTDx@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Reply-To: eric.auger@redhat.com
Cc: "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "Hao,
 Xudong" <xudong.hao@intel.com>, "peterx@redhat.com" <peterx@redhat.com>, "Xu,
 Terrence" <terrence.xu@intel.com>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "lulu@redhat.com" <lulu@redhat.com>, "Jiang,
 Yanting" <yanting.jiang@intel.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hi Jason,

On 4/5/23 13:41, Jason Gunthorpe wrote:
> On Tue, Apr 04, 2023 at 05:59:01PM +0200, Eric Auger wrote:
>
>>> but the hot reset shall fail as the group is not owned by the user.
>> sure it shall but I fail to understand if the reset fails or the device
>> plug is somehow delayed until the reset completes.
> It is just racy today - vfio_pci_dev_set_resettable() doesn't hold any
> locks across the pci_walk_bus() check to prevent hot plug in while it is
> working on the reset.

OK thanks

Eric
>
> Jason
>

