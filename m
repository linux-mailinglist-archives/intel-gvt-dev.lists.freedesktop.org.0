Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0117F67B6
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 23 Nov 2023 20:43:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2F610E349;
	Thu, 23 Nov 2023 19:43:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D5C10E34F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 23 Nov 2023 19:43:30 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-6bd20c30831so204677b3a.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 23 Nov 2023 11:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1700768610; x=1701373410;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WpkzZHg09ad7VkHOnG/quo/T41ONjJ1411UTG4haLXU=;
 b=MhOCRmMuC8SzFUVX2cBCGQFn1Ti1mCZwfxQZ2ygbenz4CH/wdyrDwsr0fAyjfZve99
 69q29lGWQQaEKprqhkDCwLhYzqMCdgBghhS8PBUyqlZ1gnT478Ep4UZXOLhO0V/YvwV2
 ZWgYTesRzHMqEnwOO7yWd2+mTVmSSVWFDMIHJm+rMOCIv3BcaxYCcdMuLkYnMbBIcrdT
 utS7ritI9ld4qQdtMEiZ9unmwjqbPOl75iYemi1oGywTZVo41yq7qknyGtJMOx5ovey4
 ikEN9NmhB4m2hXdXl/Zzc9+p/XXuoEF0rqy3RbPaJg5HuOQZALiOX3Pf9t3PqOSMNobB
 RI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700768610; x=1701373410;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WpkzZHg09ad7VkHOnG/quo/T41ONjJ1411UTG4haLXU=;
 b=r2aRlCIXnN1swqcEYVCvZudFehqBbTvi4jDl2T+E+nolWjfd6sS8GRRJBoryZAxcQv
 kgQXHUXa6Nw6uZ/bv3OmZ7yYRKfrjmRpWLh9bUx4LpBRah9g2NqzCLWyhlZsJJW+EqyY
 H1z/q00A0sPHdwzukTb0ifQ8SedRQucwz5BDtGPhV/FyXN7F3BtS1DwFG3wkRltdpCXq
 FXZBkLwdqkkg0vb7jt9d3FgxjtusImZn1Kagi2BQZe8ukNavnILnc8dTou84v5C83hrm
 3XNSFUf6BaLoZhZpP5Ub4c5khxtWpoQ4btxjh0J7izLJnDBPWdD3Foach/idcbD1J11p
 swpQ==
X-Gm-Message-State: AOJu0YzVfWZaLQbWGMx/S77HnVlYJmJZ/Qd10JWHHWiuWEeCuvxETXXA
 1O1biHwZfjiG+xsPyGplfZvGJA==
X-Google-Smtp-Source: AGHT+IEPG4J941SLrpY4uC/ri/G2ja2akCNdtY4pHEKeo+HpcNnwpEYC41wSse9D2H40uEI86qohgw==
X-Received: by 2002:a05:6a00:9381:b0:6bc:ff89:a2fc with SMTP id
 ka1-20020a056a00938100b006bcff89a2fcmr544106pfb.2.1700768610318; 
 Thu, 23 Nov 2023 11:43:30 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.194])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b006cb65cfde6dsm1567524pfu.200.2023.11.23.11.43.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 11:43:29 -0800 (PST)
Message-ID: <cb41cf91-1c75-4edc-b00f-59763344b15c@kernel.dk>
Date: Thu, 23 Nov 2023 12:43:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] eventfd: simplify signal helpers
Content-Language: en-US
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
References: <20231122-vfs-eventfd-signal-v2-0-bd549b14ce0c@kernel.org>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20231122-vfs-eventfd-signal-v2-0-bd549b14ce0c@kernel.org>
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
Cc: linux-aio@kvack.org, linux-usb@vger.kernel.org, Jan Kara <jack@suse.cz>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>,
 Tom Rix <trix@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, David Airlie <airlied@gmail.com>,
 Christoph Hellwig <hch@lst.de>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Shakeel Butt <shakeelb@google.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Leon Romanovsky <leon@kernel.org>, Harald Freudenberger <freude@linux.ibm.com>,
 Fei Li <fei1.li@intel.com>, x86@kernel.org,
 Roman Gushchin <roman.gushchin@linux.dev>, Halil Pasic <pasic@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>,
 intel-gfx@lists.freedesktop.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>, linux-fpga@vger.kernel.org,
 Zhi Wang <zhi.a.wang@intel.com>, Wu Hao <hao.wu@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 Johannes Weiner <hannes@cmpxchg.org>, linuxppc-dev@lists.ozlabs.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Moritz Fischer <mdf@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, kvm@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, cgroups@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org, intel-gvt-dev@lists.freedesktop.org,
 io-uring@vger.kernel.org, netdev@vger.kernel.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Pavel Begunkov <asml.silence@gmail.com>,
 Sean Christopherson <seanjc@google.com>, Oded Gabbay <ogabbay@kernel.org>,
 Muchun Song <muchun.song@linux.dev>,
 Peter Oberparleiter <oberpar@linux.ibm.com>, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, Benjamin LaHaise <bcrl@kvack.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Sven Schnelle <svens@linux.ibm.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 Xu Yilun <yilun.xu@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 11/22/23 5:48 AM, Christian Brauner wrote:
> Hey everyone,
> 
> This simplifies the eventfd_signal() and eventfd_signal_mask() helpers
> significantly. They can be made void and not take any unnecessary
> arguments.
> 
> I've added a few more simplifications based on Sean's suggestion.
> 
> Signed-off-by: Christian Brauner <brauner@kernel.org>
> 
> Changes in v2:
> - further simplify helpers
> - Link to v1: https://lore.kernel.org/r/20230713-vfs-eventfd-signal-v1-0-7fda6c5d212b@kernel.org

Only oddity I spotted was the kerneldoc, which someone else already
brought up.

Reviewed-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe

